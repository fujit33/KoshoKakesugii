import 'package:flutter/material.dart';
import 'package:kakesugikosho/screeens/ranking_screen.dart';
import 'package:kakesugikosho/screeens/top_screen.dart';

class ResultPage extends StatelessWidget {
  final String name;
  final int score;
  ResultPage({Key key, this.name, this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: SafeArea(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('結果発表！', style: TextStyle(fontSize: 40)),
                  ),
                  Text(
                    '$nameさんの結果',
                    style: TextStyle(fontSize: 30),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      score.toString(),
                      style: TextStyle(fontSize: 80),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          child: Text(
                            'TOPにもどる',
                            style: TextStyle(fontSize: 20),
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TopPage()),
                            );
                          },
                        ),
                        RaisedButton(
                          child: Text(
                            'ランキング',
                            style: TextStyle(fontSize: 20),
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RankPage(score: score)),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
