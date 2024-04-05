import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'controller/counter_controller.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
          ()=> Navigator.of(context).pushReplacementNamed('/login'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CounterController());
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