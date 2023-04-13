import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Press Game',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Button Press Game'),
        ),
        body: Center(
          child: ButtonPressGame(),
        ),
      ),
    );
  }
}


class ButtonPressGame extends StatefulWidget {
  @override
  _ButtonPressGameState createState() => _ButtonPressGameState();
}

class _ButtonPressGameState extends State<ButtonPressGame> {
  int _score = 0;
  Timer? _timer;
  int _start = 10;

  void _incrementScore() {
    setState(() {
      _score++;
    });
    _restartTimer();
  }

  void _restartTimer() {
    if (_timer != null) {
      _timer?.cancel();
    }

    setState(() {
      _start = 10;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start == 0) {
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Press the button as many times as you can in 10 seconds!',
          style: TextStyle(fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.0),
        Text(
          'Time remaining: $_start seconds',
          style: TextStyle(fontSize: 40.0),
        ),
        SizedBox(height: 20.0),
        Text(
          'Score: $_score',
          style: TextStyle(fontSize: 40.0),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: _incrementScore,
          child: Text(
            'Press me!',
            style: TextStyle(fontSize: 30.0,
          color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
            ),
          ),
        ),
      ],
    );
  }
}
