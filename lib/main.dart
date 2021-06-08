import 'package:flutter/material.dart';

import 'page/fingerprint_screen.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}


class MyApp  extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    getBioMetricSupport();
    getAvailableSupport();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Auth'),
      ),
      body: Center(
        child: OutlineButton(onPressed:() => authenticMe(context),child: Text('Sign in With FingerPrint'),),
      ),
    );
  }
}
