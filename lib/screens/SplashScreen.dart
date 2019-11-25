import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/constant/constant.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var visible = true;
  AnimationController controller;
  Animation<double> animation;

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    controller.forward();

    setState(() {
      visible = !visible;
    });

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: new Text(
                  'Flutter Login Demo',
                  textAlign: TextAlign.end,
                  textDirection: TextDirection.ltr,
                  maxLines: 1,
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              )
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/logo.png',
                width: animation.value * 250,
                height: animation.value * 250,
              )
            ],
          ),
        ],
      ),
    );
  }
}
