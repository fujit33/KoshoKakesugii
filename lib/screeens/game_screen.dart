import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kakesugikosho/common/painter.dart';
import 'package:kakesugikosho/models/game.dart';
import 'package:kakesugikosho/repositories/data_repositories.dart';
import 'package:kakesugikosho/screeens/result_screeen.dart';
import 'package:quiver/async.dart';

class GamePage extends StatefulWidget {
  final name;
  GamePage({Key key, this.name}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final DataRepository repository = DataRepository();
  int _counter = 0;
  bool _willAccepted = false;
  int _start = 10;
  int _current = 10;
  String _name;
  List<Offset> _points = [];

  void _addGame() {
    Game newGame = Game(
      date: DateTime.now(),
      player: _name,
      score: _counter,
      magma: 0,
    );
    repository.addGame(newGame);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _addPoint() {
    var rng = new Random();
    const double pi = 3.1415926535897932;
    var r = 120 * sqrt(rng.nextDouble());
    var theta = rng.nextDouble() * 2 * pi;

    double _x = 150 + r * cos(theta);
    double _y = 150 + r * sin(theta);

    setState(() {
      _points.add(Offset(_x, _y));
    });
  }

  void _startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      // スコアを送信
      _addGame();

      // page 遷移
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ResultPage(
                  score: _counter,
                  name: _name,
                  points: _points,
                )),
      );
      sub.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    // NOTE: Calling this function here would crash the app.
    _startTimer();

    if (widget.name.isEmpty) {
      print('null');
      _name = '名無し';
      print(_name);
    } else {
      print('else');
      _name = widget.name;
      print(_name);
    }
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
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'ふりかけ回数',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '$_counter',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                Container(
                  child: Draggable(
                    child: Hero(
                        tag: 'pepper',
                        child: Image.asset(
                          'assets/img/pepper.png',
                        )),
                    feedback: Image.asset(
                      'assets/img/pepper.png',
                      width: 70.0,
                    ),
                    childWhenDragging: Opacity(
                      opacity: 0.0,
                      child: Image.asset(
                        'assets/img/pepper.png',
                        width: 70.0,
                      ),
                    ),
                    data: 'aa',
                  ),
                  width: 70.0,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
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
                          painter: OpenPainter(points: _points),
                        ),
                      ),
                    ),
                    Align(
                      child: SizedBox(
                        width: 300,
                        height: 300,
                        child: DragTarget(
                          builder: (context, accepted, rejected) {
                            return Container();
                          },
                          onWillAccept: (String data) {
                            _incrementCounter();
                            for (int i = 0; i < 300; i++) {
                              _addPoint();
                            }
                            _willAccepted = true;
                            return true;
                          },
                          onLeave: (data) {
                            _willAccepted = false;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("残り$_current秒", style: TextStyle(fontSize: 40)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//class OpenPainter extends CustomPainter {
//  final List points;
//
//  OpenPainter({this.points});
//
//  @override
//  void paint(Canvas canvas, Size size) {
//    var paint1 = Paint()
//      ..color = Colors.grey
//      ..strokeCap = StrokeCap.round //rounded points
//      ..strokeWidth = 3;
//    //draw points on canvas
//    canvas.drawPoints(PointMode.points, points, paint1);
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) => true;
//}
