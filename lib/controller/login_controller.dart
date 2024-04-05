import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/firebase_auth_service.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  var isChecked = false.obs;

  @override
  void onReady() {
    //Set default username and password to controllers
    emailController.text = "aas@gmail.com";
    passwordController.text = "123456789";
    super.onReady();
  }

//This function is used to toggle the checkbox of login
  toggleCheckbox(bool newValue) {
    isChecked.value = newValue;
  }

  handlelogin(BuildContext context) async {
    if (isChecked.value) {
      final email = emailController.text;
      final password = passwordController.text;
      final firebaseAuthService = FirebaseAuthService();
      User? user = await firebaseAuthService
          .loginInWithEmailAndPassword(email, password);
      if (user != null) {
        final SharedPreferences prefs = await SharedPreferences
            .getInstance();
        prefs.setString('id', user.uid);
        Navigator.of(context).pushReplacementNamed(
            '/mainScreen');
      } else {
        print('Login failed');
      }
    }
    else {
      print('Please check the terms');
    }
  }
}