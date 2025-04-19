import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _input = "";

  void _buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        _input = "";
        _output = "0";
      } else if (value == "=") {
        try {
          _output = _eval(_input);
        } catch (e) {
          _output = "Error";
        }
      } else {
        _input += value;
      }
    });
  }

  String _eval(String expression) {
    try {
      final result = double.parse(expression);
      return result.toString();
    } catch (_) {
      return "Invalid";
    }
  }

  Widget _buildButton(String value) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => _buttonPressed(value),
        child: Text(value, style: TextStyle(fontSize: 28)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kalkulator Sederhana')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(_output, style: TextStyle(fontSize: 48)),
            ),
          ),
          Column(children: [
            Row(children: [_buildButton("7"), _buildButton("8"), _buildButton("9"), _buildButton("/")]),
            Row(children: [_buildButton("4"), _buildButton("5"), _buildButton("6"), _buildButton("*")]),
            Row(children: [_buildButton("1"), _buildButton("2"), _buildButton("3"), _buildButton("-")]),
            Row(children: [_buildButton("0"), _buildButton("C"), _buildButton("="), _buildButton("+")]),
          ])
        ],
      ),
    );
  }
}
