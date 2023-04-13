import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";

  String _currentNumber = "0";
  String _previousNumber = "";
  String _operation = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      _currentNumber = "0";
      _previousNumber = "";
      _operation = "";
    } else if (buttonText == "+/-") {
      _currentNumber.startsWith("-")
          ? _currentNumber = _currentNumber.substring(1)
          : _currentNumber = "-" + _currentNumber;
    } else if (buttonText == "%" && _currentNumber != "") {
      double currentNumber = double.parse(_currentNumber);
      double result = currentNumber / 100;
      _output = result.toString();
      _currentNumber = result.toString();
    } else if (buttonText == "." && _currentNumber.contains(".")) {
      return;
    } else if (buttonText == ".") {
      _currentNumber += buttonText;
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/") {
      double currentNumber = double.parse(_currentNumber);

      if (_previousNumber != "") {
        switch (_operation) {
          case "+":
            _output = (double.parse(_previousNumber) + currentNumber).toString();
            break;
          case "-":
            _output = (double.parse(_previousNumber) - currentNumber).toString();
            break;
          case "x":
            _output = (double.parse(_previousNumber) * currentNumber).toString();
            break;
          case "/":
            _output = (double.parse(_previousNumber) / currentNumber).toString();
            break;
        }
        _previousNumber = _output;
      } else {
        _previousNumber = _currentNumber;
      }

      _operation = buttonText;
      _currentNumber = "";
    } else if (buttonText == "=") {
      if (_previousNumber == "") {
        return;
      }
      double currentNumber = double.parse(_currentNumber);
      switch (_operation) {
        case "+":
          _output = (double.parse(_previousNumber) + currentNumber).toString();
          break;
        case "-":
          _output = (double.parse(_previousNumber) - currentNumber).toString();
          break;
        case "x":
          _output = (double.parse(_previousNumber) * currentNumber).toString();
          break;
        case "/":
          _output = (double.parse(_previousNumber) / currentNumber).toString();
          break;
      }
      _previousNumber = "";
      _currentNumber = _output;
    } else {
      _currentNumber += buttonText;
    }

    setState(() {
      _output = _currentNumber;
    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.25,
    color: buttonColor,
    child: TextButton(
    // shape: RoundedRectangleBorder(
    // borderRadius: BorderRadius.circular(0.0),
    // side: BorderSide(
    //  color: Colors.white,
    //  width: 1,
//     style: BorderStyle.solid,
    // ),

    //padding: EdgeInsets.all(16.0),
    onPressed: () => buttonPressed(buttonText),
    child: Text(
    buttonText,
    style: TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
    ),
    ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            child: Text(
              _output,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButton("7", 1, Colors.grey),
              buildButton("8", 1, Colors.grey),
              buildButton("9", 1, Colors.grey),
              buildButton("/", 1, Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButton("4", 1, Colors.grey),
              buildButton("5", 1, Colors.grey),
              buildButton("6", 1, Colors.grey),
              buildButton("x", 1, Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButton("1", 1, Colors.grey),
              buildButton("2", 1, Colors.grey),
              buildButton("3", 1, Colors.grey),
              buildButton("-", 1, Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButton(".", 1, Colors.grey),
              buildButton("0", 1, Colors.grey),
              buildButton("+/-", 1, Colors.grey),
              buildButton("+", 1, Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButton("C", 1, Colors.red),
              buildButton("%", 1, Colors.grey),
              buildButton("", 1, Colors.grey),
              buildButton("=", 1, Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}