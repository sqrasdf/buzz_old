import 'package:buzz/service/database_service.dart';
import 'package:buzz/service/shared_preferences_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // login
  Future logInWithEmailAndPassword(String email, String password) async {
    try {
      (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // register
  Future registerUserWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user!;
      await DatabaseService(uid: user.uid).saveUserData(name, email, password);
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // sign out
  Future signOut() async {
    try {
      // remove data from shared preferences
      await SharedPreferencesFunctions.saveUserLoggedInStatus(false);
      await SharedPreferencesFunctions.saveUserName("");
      await SharedPreferencesFunctions.saveUserEmail("");
      // sign out
      firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
