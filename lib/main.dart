import 'package:flutter/material.dart';
import 'package:kakesugikosho/screeens/game_screen.dart';
import 'package:kakesugikosho/screeens/ranking_screen.dart';
import 'package:kakesugikosho/screeens/result_screeen.dart';
import 'package:kakesugikosho/screeens/top_screen.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(
    MaterialApp(
      home: MyApp(),
      routes: <String, WidgetBuilder>{
        '/top': (BuildContext context) => new TopPage(),
        '/game': (BuildContext context) => new GamePage(),
        '/result': (BuildContext context) => new ResultPage(),
        '/ranking': (BuildContext context) => new RankPage()
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'コショウかけすぎぃ！',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'shokakiutage'),
      home: TopPage(),
    );
  }
}
