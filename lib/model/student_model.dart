import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel{
  String ?uId;
  String ?fullName;
  int ?phoneNumber;
  String ?emailAddress;
  String ?address;
  String ?gender;

  StudentModel({
  this.uId,
  this.fullName,
  this.phoneNumber,
  this.address,
  this.emailAddress,
    this.gender,
});
  toJson(){
    return{
      'id':uId,
      'full_name':fullName,
      'phone_number':phoneNumber,
      'email_address':emailAddress,
      'gender':gender,
    };
  }
  factory StudentModel.fromJson(QueryDocumentSnapshot<Map<String, dynamic>>documentSnapshot){
    final snapshot = documentSnapshot.data();
    return StudentModel(
        fullName: snapshot['full_name'],
        phoneNumber: snapshot['phone_number'],
        emailAddress: snapshot['email_address'],
        address: snapshot['address'],
        gender: snapshot['gender']
    );
  }
}

