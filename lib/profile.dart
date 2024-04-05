import 'package:flutter/material.dart';
import 'package:newpro/model/student_model.dart';
import 'package:newpro/service/firebase_database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String studentId = "";

  @override
  void initState() {
    readUidFromSharedPreferences();
    super.initState();
  }

  ///This function is used to read uid from SharedPreferences
  void readUidFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');
    if (id != null) {
      setState(() {
        studentId = id;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('View Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: ()=>Navigator.of(context).pushNamed('/student_list'),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: (studentId.isNotEmpty)
            ? FutureBuilder(
            future: buildFirebaseDatabaseService()
                .getStudentDetailsUsingUid(uId: studentId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                ///Connection to firebase is established, but has returned an error
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error fetching data',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                ///Connection to firebase is established, and has returned a data
                if (snapshot.hasData) {
                  print('Uid is $studentId');
                  final studentModel = snapshot.data;
                  return ListView(
                    children: [
                      ProfileImage(),
                      SizedBox(
                        height: 20,
                      ),
                      BasicDetails(studentModel: studentModel ??StudentModel(),),
                      SizedBox(
                        height: 20,
                      ),
                      MenuWidgets(
                        title: 'Settings',
                        onPressed: () {
                          print('Settings Clicked');
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MenuWidgets(
                        title: 'Notifications',
                        onPressed: () {
                          print('Notifications Clicked');
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MenuWidgets(
                        title: 'About App',
                      ),
                    ],
                  );
                }
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            })
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  FirebaseDatabaseService buildFirebaseDatabaseService() => FirebaseDatabaseService();
}

///This widget is used to display the circular profile images
class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/imagess/pp.jpg'),
      ),
    );
  }
}

///This is the widget for displaying the basic details of the user
class BasicDetails extends StatelessWidget {
  BasicDetails({required this.studentModel});

  final StudentModel? studentModel;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          studentModel!=null
          ?Text('Name: ${studentModel!.fullName}')
          :Text('Name: -'),
          SizedBox(
            height: 5,
          ),
          studentModel!=null
              ?Text('EmailAddress: ${studentModel!.emailAddress}')
              :Text('EmailAddress: -'),
          SizedBox(
            height: 5,
          ),
          studentModel!=null
              ?Text('PhoneNumber: ${studentModel!.phoneNumber}')
              :Text('PhoneNumber: -'),
          SizedBox(
            height: 5,
          ),
          studentModel!=null
              ?Text('Gender: ${studentModel!.gender}')
              :Text('Gender: -'),
          SizedBox(
            height: 5,
          ),
          studentModel!=null
              ?Text('Address: ${studentModel!.address}')
              :Text('Address: -'),
          SizedBox(height: 20,),
          ElevatedButton(onPressed:()=>Navigator.of(context).pushNamed('/editprofile',
          arguments:studentModel,
          ),
          child: Text("Edit Profile"),
          ),
        ],
      ),
    );
  }
}

///This widget is common for creating menus
class MenuWidgets extends StatelessWidget {
  MenuWidgets({required this.title, this.onPressed});

  String title;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(Icons.arrow_right),
          ],
        ),
      ),
    );
  }
}