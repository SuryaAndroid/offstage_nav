import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('My Settings Act...'),
          RaisedButton(
            onPressed: (){},
            child: Text('Go to color'),
          )
        ],
      ),
    );
  }
}
