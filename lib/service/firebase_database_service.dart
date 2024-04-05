import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/student_model.dart';
import '../student_list.dart';



class FirebaseDatabaseService {
  final userList = [];
  final _firestoreDb = FirebaseFirestore.instance;

  Future getuser() async {
    try {
      final CollectionReference _studentCollectionReference =
      await _firestoreDb.collection('student');
      await _studentCollectionReference.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          userList.add(result.data());
        }
      });

      return StudentList;
    } on FirebaseException catch (e) {
      print('Error in firestore database');
    } catch (e) {
      print('Something went wrong');
    }
  }

  Future getsingleuser() async {
    try {
      final CollectionReference _studentCollectionReference =
      _firestoreDb.collection('user');
      var studentDetails = await _studentCollectionReference.doc('student').get();
      if (studentDetails.exists) {
        print('The student Details is ${studentDetails.data()}');
      } else {
        print('student Details not found');
      }

      return userList;
    } on FirebaseException catch (e) {
      print('Error in firestore database');
    } catch (e) {
      print('Something went wrong');
    }
  }

  ///This function is used to create a user in Cloud Firebase
  void createUserInCloudFirebase({required StudentModel studentModel}) async {
    try {
      final CollectionReference _studentCollectionReference =
      await _firestoreDb.collection('users');

      await _studentCollectionReference.add(studentModel.toJson()).whenComplete(() {
        print('student Created Success');
      });
    } catch (e) {
      print('Something went wrong $e');
    }
  }

  ///This function is used to get user details uId
  Future<StudentModel?> getStudentDetailsUsingUid({required String uId}) async {
    try {
      final CollectionReference _studentCollectionReference =
      _firestoreDb.collection('users');
      final snapShot =
      await _studentCollectionReference.where('id', isEqualTo: uId).get();
      final studentModel =  snapShot.docs
          .map((doc) => StudentModel.fromJson(
          doc as QueryDocumentSnapshot<Map<String, dynamic>>))
          .single;
      return studentModel;
    } catch (e) {
      print('Something went wrong $e');
    }
    return null;
  }

  Future<List<StudentModel>> getStudentsFromDatabase() async {
    try {
      final CollectionReference _studentCollectionReference =
      _firestoreDb.collection('users');
      final documentSnapshot = await _studentCollectionReference.get();
      if (documentSnapshot.docs.isNotEmpty) {
        final studentsList = documentSnapshot.docs
            .map((doc) => StudentModel.fromJson(
            doc as QueryDocumentSnapshot<Map<String, dynamic>>))
            .toList();
        return studentsList;
      } else {
        return [];
      }
    } catch (e) {
      print('Something went wrong $e');
    }
    return [];
  }

  ///Function to update User using UID
  Future<StudentModel?> updateStudentUsingUID({required String uId, required StudentModel studentModel}) async{
    try{
      final CollectionReference _studentCollectionReference =
      _firestoreDb.collection('users');
      final snapShot =
      await _studentCollectionReference.where('id', isEqualTo: uId).get();
      if(snapShot.docs.isNotEmpty){
        final documentId = snapShot.docs.first.id;
        await _studentCollectionReference.doc(documentId).update(studentModel.toJson());
        final studentModelResponse = StudentModel.fromJson(
            snapShot.docs.first as QueryDocumentSnapshot<Map<String, dynamic>>);
        return studentModelResponse;
      }else{
        return null;
      }
    }catch(e){
      print('Something went wrong $e');
    }
    return null;
  }

  ///Function to delete user from database using user uid
  Future<List<StudentModel>> deleteStudentUsingUID({required String uId}) async
  {
    try{
      final CollectionReference _studentCollectionReference =
      _firestoreDb.collection('users');
      final snapShot =
      await _studentCollectionReference.where('id', isEqualTo: uId).get();

      if(snapShot.docs.isNotEmpty){
        final documentId = snapShot.docs.first.id;
        await _studentCollectionReference.doc(documentId).delete();
        final studentlist = snapShot.docs
            .map((doc) => StudentModel.fromJson(
            doc as QueryDocumentSnapshot<Map<String, dynamic>>))
            .toList();
        return studentlist;
      }else{
        return [];
      }

    }catch(e){
      print('Something went wrong $e');
    }
    return [];
  }
}
