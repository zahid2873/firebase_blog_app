import 'dart:async';

import 'package:firebase_blog_app/screen/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    });
    return Scaffold(
      appBar: AppBar(title:Text("Splash"),),
    );
  }
}
