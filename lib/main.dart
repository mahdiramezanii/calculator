import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  String textInput = "";

  String result = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 19, 18, 18),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "$textInput",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "$result",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _getRow("ac", "cl", "/", "%"),
                      _getRow("9", "8", "7", "*"),
                      _getRow("6", "5", "4", "-"),
                      _getRow("1", "2", "3", "+"),
                      _getRow("0", "00", ".", "="),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getRow(String text1, String text2, String text3, String text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (text1 == "ac") {
                textInput = "";
                result = "";
              } else {
                textInput = textInput + text1;
              }
            });
          },
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: getColor(text1),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                "$text1",
                style: TextStyle(
                    color: getTextColor(text1),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (text2 == "cl") {
                if (textInput.length > 0) {
                  textInput = textInput.substring(0, textInput.length - 1);
                } else if (result.length > 0) {
                  result = "";
                }
              } else {
                textInput = textInput + text2;
              }
            });
          },
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: getColor(text2)),
            child: Center(
              child: Text(
                "$text2",
                style: TextStyle(color: getTextColor(text3), fontSize: 25),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              textInput = textInput + text3;
            });
          },
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: getColor(text3)),
            child: Center(
              child: Text(
                "$text3",
                style: TextStyle(color: getTextColor(text3), fontSize: 25),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (text4 == "=") {
                if (textInput.length > 0) {
                  Parser p = Parser();
                  Expression experetion = p.parse(textInput);
                  ContextModel contextmodel = ContextModel();
                  double eval =
                      experetion.evaluate(EvaluationType.REAL, contextmodel);

                  result = eval.toString();
                }
              } else {
                textInput = textInput + text4;
              }
            });
          },
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                color: getColor(text4),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                "$text4",
                style: TextStyle(color: getTextColor(text4), fontSize: 25),
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool is_operator(String text) {
    var list = ["ac", "cl", "/", "%", "*", "-", "+", "="];

    for (var item in list) {
      if (item == text) {
        return true;
      }
    }
    return false;
  }

  Color getColor(String text) {
    if (is_operator(text)) {
      if (text == "ac") {
        return Colors.red;
      } else if (text == "=") {
        return Colors.green;
      } else {
        return Colors.blue;
      }
    } else {
      return backgroundGrey;
    }
  }

  Color getTextColor(String text) {
    if (is_operator(text)) {
      return Colors.white;
    } else {
      return Colors.white;
    }
  }
}
