import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpro/model/student_model.dart';
import 'package:newpro/service/firebase_database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentController extends GetxController {
  var studentList = <StudentModel>[].obs;
  var studentModel = StudentModel().obs;
  final firebaseDatabaseService = FirebaseDatabaseService();
  var uId = "".obs;

  final fullNameController = TextEditingController();

  final emailAddressController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final passwordController = TextEditingController();

  final streetAddressController = TextEditingController();

  final emailRegexPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  var gender = "Female".obs;
  @override
  void onReady() {
    getUIDFromSharedPreference();
    super.onReady();
  }

  ///This function is used to get all users from firebase database
  void getUIDFromSharedPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? id = prefs.getString('id');
    if (id != null) {
      uId.value = id;
      print('UID value ${uId.value}');
    }
    getStudentDetailUsingUidfromFirebase();
  }

  void getAllStudentFromFirebase() async {
    studentList.value = await firebaseDatabaseService.getStudentsFromDatabase();
  }

  void deleteStudentUsingUID(
      {required String uId, required BuildContext dialogContext}) async {
    studentList.value =
        await firebaseDatabaseService.deleteStudentUsingUID(uId: uId);
    Navigator.of(dialogContext).pop();
  }

  getStudentDetailUsingUidfromFirebase() async {
    StudentModel? studentDetails;
    studentDetails =
        await firebaseDatabaseService.getStudentDetailsUsingUid(uId: uId.value);

    if (studentDetails != null) {
      studentModel.value = studentDetails;
    }
  }

  updateStudentDetailsUsingUidFirebase({required BuildContext context}) async {
    final StudentModel studentModelRequest = StudentModel(
      uId: uId.value,
      fullName: fullNameController.text,
      emailAddress: emailAddressController.text,
      phoneNumber: int.parse(phoneNumberController.text),
      address: streetAddressController.text,
      gender: gender.value,
    );
    print('StudentModel Request ${studentModelRequest.toJson()}');
    if (uId.value.isNotEmpty) {
      await firebaseDatabaseService.updateStudentUsingUID(
          uId: uId.value, studentModel: studentModelRequest);
    }
    getStudentDetailUsingUidfromFirebase();

    Navigator.of(context).pop();
  }
}
