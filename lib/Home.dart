import 'package:flutter/material.dart';

import 'ColorScreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('My Home Act...'),
          RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ColorScreen()));
              },
              child: Text('Go to color'),
          )
        ],
      ),
    );
  }
}
