import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/certificates/certificates.dart';
import 'package:roomy/feature/tenant_mode_listing/model/post_model.dart';
import 'package:roomy/feature/tenant_mode_listing/model/room_model.dart';
import 'package:roomy/feature/tenant_mode_listing/model/user_model.dart';

final roomsCollection = FirebaseFirestore.instance.collection('rooms');

class PostProvider with ChangeNotifier {
  List<String> images;
  int amountBed;
  int amountBath;
  int price;
  String state;
  String timeRent;
  String prefferedGender;
  String title;
  String description;
  String prefferedAge;
  String prefferedOccupation;

  bool selected;
  String ownerId;
  int currentImage;
  bool isFurnished;
  String type;

  List<String> ammenities = [];
  List<File> imageFiles = [];

  List<String> rules = [];
  //---------------------------------------------------------
  List<RoomModel> _rooms = [];
  List<RoomModel> get rooms => _rooms;
  List<RoomModel> _wishlist = [];
  List<RoomModel> get wishlist => _wishlist;

  String getGender(bool isTrue) {
    if (isTrue == true) {
      return 'Male';
    } else {
      return 'Female';
    }
  }

  Future<void> postRoom(PostModel room) async {
    final id = roomsCollection.doc().id;
    room.id = id;
    List<String> urls = [];

    for (File image in imageFiles) {
      final ref = await FirebaseStorage.instance
          .ref('images/$id/posts/${DateTime.now().toIso8601String()}')
          .putFile(image);
      urls.add(await ref.ref.getDownloadURL());
    }
    room.images = urls;
    await roomsCollection.doc(room.id).set(room.toJson());
  }

  Future<List<RoomModel>> fetchRooms(UserModel you) async {
    final snap = await roomsCollection.where('status', isEqualTo: true).get();
    final List<UserModel> users = [];
    final snapshot = snap.docs.where((element) =>
        element['prefferedGender'] == getGender(you.gender) &&
        // element['occupation'] == you.occupation &&
        (you.questionnaires.contains('pet')) &&
        //     element['rules'].contains('No')) &&
        double.parse(element['rentAmount'].toString()) <
            double.parse(you.maxRent.toString()));

    final posts = snapshot.map((doc) => PostModel.fromJson(doc)).toList();

    for (PostModel post in posts) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(post.ownerId)
          .get()
          .then((value) {
        users.add(UserModel.fromJson(value));
      });
    }
    notifyListeners();

    return _rooms = posts
        .map((post) => RoomModel(
            post: post,
            user: users.firstWhere((user) => user.id == post.ownerId)))
        .toList();
  }

  Future<List<RoomModel>> fetchAlRooms() async {
    final snap = await roomsCollection.where('status', isEqualTo: true).get();
    final List<UserModel> users = [];

    final posts = snap.docs.map((doc) => PostModel.fromJson(doc)).toList();

    for (PostModel post in posts) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(post.ownerId)
          .get()
          .then((value) {
        users.add(UserModel.fromJson(value));
      });
    }
    notifyListeners();

    return _rooms = posts
        .map((post) => RoomModel(
            post: post,
            user: users.firstWhere((user) => user.id == post.ownerId)))
        .toList();
  }

  Future<List<RoomModel>> fetchPendingRooms() async {
    final snap = await roomsCollection.where('status', isEqualTo: false).get();
    final List<UserModel> users = [];

    final posts = snap.docs.map((doc) => PostModel.fromJson(doc)).toList();

    for (PostModel post in posts) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(post.ownerId)
          .get()
          .then((value) {
        users.add(UserModel.fromJson(value));
      });
    }
    notifyListeners();

    return _rooms = posts
        .map((post) => RoomModel(
            post: post,
            user: users.firstWhere((user) => user.id == post.ownerId)))
        .toList();
  }

  Future<List<RoomModel>> fetcLandlordRooms() async {
    final uid = FirebaseAuth.instance.currentUser.uid;
    final snapshot =
        await roomsCollection.where('ownerId', isEqualTo: uid).get();
    final userResult =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    final posts = snapshot.docs
        .where((element) => element['status'] == true)
        .map((doc) => PostModel.fromJson(doc))
        .toList();

    notifyListeners();

    return _rooms = posts
        .map((post) =>
            RoomModel(post: post, user: UserModel.fromJson(userResult)))
        .toList();
  }

  Future<List<RoomModel>> fetchWishlist() async {
    final uid = FirebaseAuth.instance.currentUser.uid;
    final userResult =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    final user = UserModel.fromJson(userResult);
    final List<RoomModel> myWishlist = [];

    for (String roomId in user.wishlist) {
      final postResult = await roomsCollection.doc(roomId).get();

      final post = PostModel.fromJson(postResult);

      final ownerResult = FirebaseFirestore.instance
          .collection('users')
          .doc(post.ownerId)
          .get();

      final owner = UserModel.fromJson(ownerResult);

      myWishlist.add(RoomModel(
        post: post,
        user: owner,
      ));
    }
    _wishlist = myWishlist;
    return _wishlist;
  }

  Future<void> deletePost(String id) async {
    await roomsCollection.doc(id).delete();
    notifyListeners();
  }

  Future<void> approvePost(String id) async {
    await roomsCollection.doc(id).update({
      'status': true,
    });
    notifyListeners();
  }
}
