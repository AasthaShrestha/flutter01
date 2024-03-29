import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Timer(
      Duration(seconds: 10),
          ()=> Navigator.of(context).pushReplacementNamed('/topPicks'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Splash'),
      ),
      body:Center(
          // child: Image.asset('assets/images/infinity.gif'),
        child: SvgPicture.asset('assets/images/Belo.svg'),
      ),
    );
  }
}