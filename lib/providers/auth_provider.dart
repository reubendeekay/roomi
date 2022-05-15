import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:roomy/feature/tenant_mode_listing/model/user_model.dart';

class AuthProvider with ChangeNotifier {
  bool isOnline = false;
  UserModel _user;
  UserModel get user => _user;

  void setUser(UserModel newUser) {
    _user = newUser;
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      await getUser();
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> signUp(UserModel newUser) async {
    UserCredential signUpUser;

    try {
      signUpUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: newUser.email, password: newUser.password);
    } catch (e) {
      print(e.toString());
    }
    newUser.id = signUpUser.user.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(signUpUser.user?.uid)
        .set(newUser.toJson());
    await getUser();

    notifyListeners();
  }

  Future<void> getUser() async {
    final uid = FirebaseAuth.instance.currentUser.uid;
    try {
      final userResults =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      _user = UserModel.fromJson(userResults);
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getOnlineStatus() async {
    final uid = FirebaseAuth.instance.currentUser.uid;

    final databaseRef = FirebaseDatabase.instance.ref('users/$uid');
    if (isOnline) {
      databaseRef.update({
        'isOnline': true,
        'lastSeen': DateTime.now().microsecondsSinceEpoch,
      });
      isOnline = true;
    }

    databaseRef.onDisconnect().update({
      'isOnline': false,
      'lastSeen': DateTime.now().microsecondsSinceEpoch,
    }).then((_) => {
          isOnline = false,
        });

    notifyListeners();
  }

  Future<void> updateProfile(UserModel update) async {
    final uid = FirebaseAuth.instance.currentUser.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'name': update.name,
      'email': update.email,
      'phone': update.phoneNumber,
      'updatedAt': Timestamp.now(),
    });
    notifyListeners();
  }
}
