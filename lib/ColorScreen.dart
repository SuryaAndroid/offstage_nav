import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({Key? key}) : super(key: key);

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: RaisedButton(
              onPressed: (){},
              child: Text("Go to"),
            ),
          )
        ],
      ),
    );
  }
}
