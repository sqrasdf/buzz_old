import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // collection for users
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  // collection for groups
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");

  // saving user's data in database
  Future saveUserData(String name, String email, String password) async {
    return await userCollection.doc(uid).set({
      "name": name,
      "email": email,
      "password": password,
      "groups": [],
      "profilePic": "",
      "uid": uid,
    });
  }
}
