import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newpro/grid_view.dart';
import 'package:newpro/dashboard.dart';
import 'package:newpro/splash.dart';
import 'package:newpro/top_picks.dart';

import 'list_view.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: false,
      brightness: Brightness.light,
    ),
    routes:{
      '/':(BuildContext context)=>Splash(),
      '/gridView':(context)=>GridViewScreen(),
      '/dashboard':(context)=>Dashboard(),
      '/ListViewScreen':(context)=>ListViewScreen(),
      '/topPicks':(context)=>TopPicks(),

    },
    debugShowCheckedModeBanner:false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3),()=>Navigator.of(context).pushNamed('/gridView'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Samriddhi'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('This is the main screen'),
      ),
    ) ;
  }
}



