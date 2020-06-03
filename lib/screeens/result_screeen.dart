import 'package:flutter/material.dart';
import 'package:kakesugikosho/common/painter.dart';
import 'package:kakesugikosho/screeens/ranking_screen.dart';
import 'package:kakesugikosho/screeens/top_screen.dart';
import 'package:screenshot_share_image/screenshot_share_image.dart';

class ResultPage extends StatefulWidget {
  final String name;
  final int score;
  final List points;
  ResultPage({Key key, this.name, this.score, this.points}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    super.initState();
  }

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
                    'ふりかけ回数',
                    style: TextStyle(fontSize: 30),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.score.toString(),
                      style: TextStyle(fontSize: 80),
                    ),
                  ),
                  Stack(alignment: Alignment.center, children: <Widget>[
                    Align(
                      child: SizedBox(
                        width: 300,
                        height: 300,
                        child: Center(
                          child: Image.asset('assets/img/ramen.png'),
                        ),
                      ),
                    ),
                    Align(
                      child: SizedBox(
                        width: 300,
                        height: 300,
                        child: CustomPaint(
                          painter: OpenPainter(points: widget.points),
                        ),
                      ),
                    ),
                  ]),
                  RaisedButton(
                    child: Text(
                      '結果をシェア！',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      ScreenshotShareImage.takeScreenshotShareImage();
                    },
                    color: Colors.lightBlueAccent,
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
                                  builder: (context) =>
                                      RankPage(score: widget.score)),
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
