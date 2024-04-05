import 'package:flutter/material.dart';
import 'package:newpro/service/firebase_database_service.dart';

import 'model/student_model.dart';

class StudentList extends StatelessWidget {
  const StudentList ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: FirebaseDatabaseService().getUsersFromDatabase(),
        builder: (context, snapShot){
          if(snapShot.connectionState == ConnectionState.done){
            if(snapShot.hasError){
              ///Connection with firebase is establishes but returned an error
              return Center(
                child: Text('Error loading Student'),
              );
            }

            ///Connection is established and firebase returned some data
            if(snapShot.hasData){
              final studentList = snapShot.data;
              if(studentList!=null && studentList.isNotEmpty){
                return ListView.builder(
                  itemCount: studentList.length,
                  itemBuilder: (context, index){
                    final studentModel = studentList[index];
                    return BasicDetails(
                      studentModel: studentModel,
                    );
                  },
                );
              }else{
                return Center(
                  child: Text('No Student found'),
                );
              }
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class BasicDetails extends StatelessWidget {
  BasicDetails({required this.studentModel});

  final StudentModel? studentModel;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(
                    0,
                    3,
                  ), // changes position of shadow
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                studentModel !=null? Text('Name: ${studentModel!.fullName}'): Text('Name: -'),
                SizedBox(
                  height: 5,
                ),
                studentModel !=null? Text('Email: ${studentModel!.emailAddress}'): Text('Email: -'),
                SizedBox(
                  height: 5,
                ),
                studentModel !=null? Text('Phone: ${studentModel!.phoneNumber}'): Text('Phone: -'),
                SizedBox(
                  height: 5,
                ),
                studentModel !=null? Text('Address: ${studentModel!.address}'): Text('Address: -'),
                SizedBox(
                  height: 5,
                ),
                studentModel !=null? Text('Gender: ${studentModel!.gender}'): Text('Gender: -'),

              ],
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.cancel, color: Colors.red),
                onPressed: (){
                  showDialog(
                      context: context, builder: (dialogContext){
                    return AlertDialog(
                      icon: Icon(Icons.warning),
                      title: Text('Delete student'),
                      content: Text('Are you sure you want to delete the student?'),
                      actions: [
                        TextButton(
                            child: Text('YES'),
                            onPressed: () async{
                              final firebaseDatabaseService = FirebaseDatabaseService();
                              if(studentModel != null){
                                if(studentModel!.uId != null){
                                  print('student Id ${studentModel!.uId!}');
                                  await firebaseDatabaseService.deleteStudentUsingUID(uId: studentModel!.uId!);
                                  Navigator.of(dialogContext).pop();
                                }
                              }
                            }
                        ),
                        SizedBox(width: 10),
                        TextButton(onPressed: ()=> Navigator.of(dialogContext).pop(),
                            child: Text('NO')),
                      ],
                    );
                  }
                  );

                },
              )
          )
        ],
      ),
    );
  }
}