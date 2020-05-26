import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kakesugikosho/repositories/data_repositories.dart';
import 'package:kakesugikosho/screeens/top_screen.dart';

class RankPage extends StatefulWidget {
  final int score;
  RankPage({Key key, this.score}) : super(key: key);

  @override
  _RankPageState createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {
  final DataRepository repository = DataRepository();

  @override
  Widget build(BuildContext context) {
    var _score = widget.score.toString();
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/img/wood.jpg"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'ランキング',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '今回スコア $_score',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  RaisedButton(
                    child: Text(
                      'TOPにもどる',
                      style: TextStyle(fontSize: 20),
                    ),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => TopPage()),
                      );
                    },
                  ),
                  StreamBuilder(
                      stream: repository.getStream(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return LinearProgressIndicator();

                        return _buildList(context, snapshot.data.documents);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Expanded(
      child: SizedBox(
        height: 200.0,
        child: ListView(
          children: snapshot.map((document) {
            return ListTile(
              title: new Text(
                document['score'].toString(),
                style: TextStyle(fontSize: 30),
              ),
              subtitle: new Text(
                document['player'],
                style: TextStyle(fontFamily: 'roboto', fontSize: 20),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
