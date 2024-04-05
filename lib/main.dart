import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpro/dashboard.dart';
import 'package:newpro/grid_view.dart';
import 'package:newpro/list_view.dart';
import 'package:newpro/profile.dart';
import 'package:newpro/splash.dart';
import 'package:newpro/student_list.dart';
import 'package:newpro/top_picks.dart';
import 'package:newpro/register.dart';
import 'package:newpro/utils/DefaultFirebaseOptions.dart';
import 'controller/counter_controller.dart';
import 'editProfile.dart';
import 'login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ///This function is to initialize Firebase in the project
  initializeFirebase();

  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: false,
      brightness: Brightness.light,
    ),
    routes: {
      '/': (BuildContext context) => Splash(),
      '/gridView': (context) => GridViewScreen(),
      '/dashboard': (context) => Dashboard(),
      // '/listViewScreen':(context)=>ListViewScreen(),
      // '/topPicks':(context)=> TopPicks(),
      '/mainScreen': (context) => MyApp(),
      '/register': (context) => Register(),
      '/login': (context) => Login(),
      '/profile': (context) => Profile(),
      '/editprofile': (context) => EditProfile(),
      '/student_list': (context) => StudentList(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

void initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final pages = [
    Dashboard(),
    TopPicks(),
    GridViewScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    //dependecy Injection for creating objects

    return Scaffold(
      body: pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard,color: Colors.deepPurpleAccent),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.topic,color: Colors.deepPurpleAccent),
              label: 'TopPicks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list,color: Colors.deepPurpleAccent),
              label: 'GridViewScreen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity_rounded,color: Colors.deepPurpleAccent),
              label: 'profile',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
