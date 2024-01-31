import 'package:flutter/material.dart';

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
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.cyan),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DecoratedBox(
                  position: DecorationPosition.background,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(300)),
                  child: Container(
                    height: 20,
                    width: 20,
                    child: Text("df"),
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
