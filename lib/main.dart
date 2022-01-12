import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const RandomColor());
}

class RandomColor extends StatefulWidget {
  const RandomColor({Key? key}) : super(key: key);

  @override
  _RandomColorState createState() => _RandomColorState();
}

Color primaryColor = Colors.redAccent;
late _RandomColorState state;

class _RandomColorState extends State<RandomColor> {
  void callSS() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    state = this;
    return MaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.light(primary: primaryColor)),
      home: const ColorGen(),
    );
  }
}

void changeColor() {
  primaryColor = Color(Random().nextInt(0xffffffff));
  state.callSS();
}

class ColorGen extends StatefulWidget {
  const ColorGen({Key? key}) : super(key: key);

  @override
  _ColorGenState createState() => _ColorGenState();
}

class _ColorGenState extends State<ColorGen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Random color generator'),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.6,
          child:OutlinedButton(
            onPressed: changeColor,
            child: Text(
              'Click here',
              style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.05),
            ),
          ),
        ),
      ),
    ));
  }
}
