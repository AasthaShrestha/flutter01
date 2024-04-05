import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService{
  final _auth = FirebaseAuth.instance;

  Future<User?> signUpUserWithEmailAndPassword(String email, String password) async{
    print("Email $email and password $password");
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }
    on FirebaseException catch(e){
      print("Firebase Auth Exception $e");
    }
    catch(e) {
      print('Something went wrong');
    }
    return null;
  }
  Future<User?>loginInWithEmailAndPassword(String email,String password)async{
    try{
      UserCredential userCredential= await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }
    on FirebaseException catch(e){
      print("Firebase Auth Exception $e");
    }
    catch(e){
      print('Something went wrong $e');
    }return null;
  }
  void signout() async{
    try{
      await _auth.signOut();
    }catch(e){
      print('Error while signout');
    }

  }
}