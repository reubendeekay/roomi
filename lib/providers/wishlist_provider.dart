import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:roomy/feature/tenant_mode_listing/model/post_model.dart';
import 'package:roomy/feature/tenant_mode_listing/model/room_model.dart';
import 'package:roomy/feature/tenant_mode_listing/model/user_model.dart';
import 'package:roomy/providers/post_provider.dart';

class WishlistProvider with ChangeNotifier {
  Future<void> addToWishList(String id, bool exists) async {
    final uid = FirebaseAuth.instance.currentUser.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'wishlist':
          exists ? FieldValue.arrayRemove([id]) : FieldValue.arrayUnion([id])
    });
  }

  Future<List<RoomModel>> getWishlist() async {
    final uid = FirebaseAuth.instance.currentUser.uid;

    final userRef =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    List<RoomModel> rooms = [];

    for (var element in UserModel.fromJson(userRef).wishlist) {
      final snapshot = await roomsCollection.doc(element).get();
      final post = PostModel.fromJson(snapshot);

      final userResult = await FirebaseFirestore.instance
          .collection('users')
          .doc(post.ownerId)
          .get();

      final user = UserModel.fromJson(userResult);

      rooms.add(RoomModel(post: post, user: user));
    }

    notifyListeners();
    print(rooms.length);

    return rooms;
  }
}
