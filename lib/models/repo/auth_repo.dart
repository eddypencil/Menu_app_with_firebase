import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signUp(String email, String password) async {
    try{
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
          return userCredential;
    }catch (e){
     throw Exception("Sign up failed: ${e.toString()}");
    }
  }

  Future<UserCredential?> login(String email, String password) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    }catch (e){
      throw Exception("Sign up failed: ${e.toString()}");
    }
  }

  Future<void> signOut() async {
    try{
    await _auth.signOut();
    }catch (e){
      throw Exception("Sign up failed: ${e.toString()}");
    }
  }
}
