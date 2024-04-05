import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpro/service/firebase_database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/student_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();

}

class _EditProfileState extends State<EditProfile> {
  final StudentController studentController=Get.find();

  final _formKey = GlobalKey<FormState>();




  ///Functio to set default studentmodel value to form controllers

  void setValuesFromStudentModelInfromController() {
    final StudentModel? studentModelDetails = ModalRoute
        .of(context)!
        .settings
        .arguments as StudentModel;


    if (studentModelDetails != null) {
      if (studentModelDetails.fullName != null) {
        studentController.fullNameController.text = studentModelDetails.fullName!;
      }

      if (studentModelDetails.emailAddress != null) {
        studentController.emailAddressController.text = studentModelDetails.emailAddress!;
      }

      if (studentModelDetails.phoneNumber != null) {
        studentController.phoneNumberController.text =
            studentModelDetails.phoneNumber!.toString();
      }

      if (studentModelDetails.address != null) {
        studentController.streetAddressController.text = studentModelDetails.address!;
      }

      /// if (studentModelDetails.gender != null) {
      ///   gender = studentModelDetails.gender!;
      /// }
    }
  }

  @override
  void didChangeDependencies() {
    setValuesFromStudentModelInfromController();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

    @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
          centerTitle: true,
        ),
        body: Form(
          key: studnetController.formKey,
          child:Center(
          child: Container(
            padding: EdgeInsets.only(left: 10, top: 20),
            width: MediaQuery
                .of(context)
                .size
                .width / 1.5,
            child: ListView(
              children: [
                EditProfileImage(),

                TextFormField(
                  studentcontroller.fullNameController,
                  keyboardType: TextInputType.name,
                  maxLength: 30,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter full name',
                  ),
                  validator: (fullNameValue) {
                    if (fullNameValue == null || fullNameValue
                        .trim()
                        .isEmpty) {
                      return 'Please Enter Full Name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailAddressController,
                  maxLength: 30,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email address',
                  ),
                  validator: (emailValue) {
                    if (emailValue == null || emailValue
                        .trim()
                        .isEmpty) {
                      return 'Please enter your email address';
                    }
                    final regex = RegExp(emailRegexPattern);
                    if (!regex.hasMatch(emailValue)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),
                TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your phone number',
                  ),
                  validator: (phoneNumberValue) {
                    if (phoneNumberValue == null ||
                        phoneNumberValue
                            .trim()
                            .isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: streetAddressController,
                  keyboardType: TextInputType.streetAddress,
                  maxLength: 20,
                  maxLines: 4,
                  //lines or height of box
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your address',
                  ),
                  validator: (streetAddressValue) {
                    if (streetAddressValue == null ||
                        streetAddressValue
                            .trim()
                            .isEmpty) {
                      return 'Please Enter address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Text('Select your Gender'),
                SizedBox(height: 5),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Radio(
                      value: 'Female',
                      groupValue: gender,
                      onChanged: (newValue) {
                        // setState(() {
                        //   if (newValue != null) {
                        //     gender = newValue;
                        //   }
                        // });
                      },
                    ),
                    Text('Female'),
                    SizedBox(width: 30),
                    Radio(
                      value: 'Male',
                      groupValue: gender,
                      onChanged: (newValue) {
                        // setState(() {
                        //   if (newValue != null) {
                        //     gender = newValue;
                        //   }
                        // });
                      },
                    ),
                    Text('Male'),
                  ],
                ),
                SizedBox(height:20),
                ElevatedButton(
                  onPressed:() async{
                    final SharedPreferences prefs=
                    await SharedPreferences.getInstance();
                    final uId=prefs.getString('id');
                    if(uId!=null){
                      final studentModelRequest = StudentModel(
                          uId: uId,
                          fullName: fullNameController.text,
                        emailAddress: emailAddressController.text,
                        phoneNumber: int.parse(phoneNumberController.text),
                        address: streetAddressController.text,
                        gender: gender,
                      );
                      final studentModelResponse=await FirebaseDatabaseService()
                          .updatestudentUsingUID(
                          uId: uId, studentModel: studentModelRequest);
                      if (studentModelResponse!=null){
                        print('Data update Success');
                      }else{
                        print('Error updating');
                      }
                    }
                  },
                  child:Text('Update'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }


class EditProfileImage extends StatelessWidget{
    @override
  Widget build(BuildContext context){
    return Stack(
      children: [
      SizedBox(
      height: 100,
      width: 100,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/pp.jpg'),
      ),
    ),
        Positioned(
          bottom: 0,
          right: 0,
          child:IconButton(onPressed: (){},
          icon: Icon(Icons.edit),
          ),
        ),
      ],
    );
  }
  }
