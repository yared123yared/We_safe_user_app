import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  Widget child;

  MySplashScreen({required this.child});

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => widget.child)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/splash_for_wesafe.png',
        fit: BoxFit.fill,
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }
}
