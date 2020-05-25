import 'package:flutter/material.dart';
import 'package:kakesugikosho/screeens/game_screen.dart';

class TopPage extends StatefulWidget {
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  final nameController = TextEditingController();

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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextFormField(
                  controller: nameController,
                  decoration:
                      InputDecoration(labelText: 'なまえ', hintText: '名無し'),
                  style: TextStyle(fontSize: 22, fontFamily: 'roboto'),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                        tag: 'pepper',
                        child: Image.asset(
                          'assets/img/pepper.png',
                          width: 100,
                          height: 100,
                        )),
                    Image.asset('assets/img/title.png'),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'ラーメンのうまさはコショウの量',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  elevation: 10,
                  color: Colors.white,
                  child: Text(
                    'ゲーム開始！',
                    style: TextStyle(fontSize: 40),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              GamePage(name: nameController.text)),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  icon: new Icon(Icons.info),
                  onPressed: () => showLicensePage(
                    context: context,
                    applicationName: "F-Punks",
                    applicationVersion: "1.0.0",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
