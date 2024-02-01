import 'package:flutter/material.dart';
import 'colors.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 400,
                  color: backgroundGrey,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: backgroundGreyDark,
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(width: 0, color: Colors.amber),
              ),
            ),
            child: Text(
              "$text1",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                shape: CircleBorder(
              side: BorderSide(width: 0, color: Colors.amber),
            )),
            child: Text(
              "$text2",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(width: 0, color: Colors.amber),
              ),
            ),
            child: Text(
              "$text3",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(width: 0, color: Colors.amber),
              ),
            ),
            child: Text(
              "$text4",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
}
