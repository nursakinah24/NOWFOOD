import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nowfood/model/user_model.dart';
import 'package:nowfood/view/login_page.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  bool get success => false;

  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;

      if (user != null) {
        final DocumentSnapshot snapshot =
            await usersCollection.doc(user.uid).get();

        final UserModel currentUser = UserModel(
            uId: user.uid,
            email: user.email ?? '',
            name: snapshot['name'] ?? '',
            address: snapshot['address'] ?? '',
            phoneNumber: snapshot['phoneNumber'] ?? '',);
        return currentUser;
      }
    } catch (e) {
      print('Error signing in: $e');
    }
    return null;
  }

   Future<UserModel?> registerWithEmailAndPassword(
      String email, String password, String name, String address, String phoneNumber) async {
    try {
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;

      if (user != null) {
        final UserModel newUser =
            UserModel(uId: user.uid, email: user.email ?? '', name: name, address: address, phoneNumber: phoneNumber);

        await usersCollection.doc(newUser.uId).set(newUser.toMap());
        return newUser;
      }
    } catch (e) {
     print('Error registering user: $e');
    }
    return null;
  }

  UserModel? getCurrentUser() {
    final User? user = auth.currentUser;
    if (user != null) {
      return UserModel.fromFirebaseUser(user);
    }
    return null;
  }

  Future<void> signOut(BuildContext context) async {
    await auth.signOut();
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  );
  }
}
