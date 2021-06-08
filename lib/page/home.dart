import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  String signInFrom = '';
  Home({required this.signInFrom});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(child: Container(
        child: Text(signInFrom),
      ),),
    );
  }
}
