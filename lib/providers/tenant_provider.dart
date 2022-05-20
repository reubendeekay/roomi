import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:roomy/feature/tenant_mode_listing/model/post_model.dart';
import 'package:roomy/feature/tenant_mode_listing/model/room_model.dart';
import 'package:roomy/feature/tenant_mode_listing/model/user_model.dart';
import 'package:roomy/providers/post_provider.dart';

class TenantModel {
  TenantModel(this.user, this.room);

  final UserModel user;
  final RoomModel room;
}

class TenantProvider with ChangeNotifier {
  Future<void> addTenant(String user, String room) async {
    final uid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance
        .collection('tenancy')
        .doc(user)
        .collection('tenants')
        .add({
      'user': uid,
      'room': room,
    });
    notifyListeners();
  }

  Future<List<TenantModel>> getTenants(UserModel user) async {
    final uid = FirebaseAuth.instance.currentUser.uid;
    final results = await FirebaseFirestore.instance
        .collection('tenancy')
        .doc(uid)
        .collection('tenants')
        .get();
    List<TenantModel> tenants = [];
    for (var element in results.docs) {
      final snapshot = await roomsCollection.doc(element['room']).get();

      final post = PostModel.fromJson(snapshot);
      final userRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(element['user'])
          .get();
      final userR = UserModel.fromJson(userRef);

      tenants.add(TenantModel(userR, RoomModel(post: post, user: user)));
    }

    notifyListeners();
    return tenants;
  }
}
