import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:roomy/feature/tenant_mode_listing/model/message_model.dart';
import 'package:roomy/feature/tenant_mode_listing/model/room_model.dart';
import 'package:roomy/feature/tenant_mode_listing/model/user_model.dart';

class ChatTileModel {
  final UserModel user;
  String latestMessage;
  final RoomModel room;
  Timestamp time;
  final String latestMessageSenderId;
  final String chatRoomId;

  ChatTileModel(
      {this.user,
      this.latestMessage,
      this.time,
      this.chatRoomId,
      this.latestMessageSenderId,
      this.room});
}

class ChatProvider with ChangeNotifier {
  List<ChatTileModel> _contactedUsers = [];

  List<ChatTileModel> get contactedUsers => [..._contactedUsers];

  /////////////////SEND MESSAGE////////////////////////
  Future<void> sendMessage(String userId, MessageModel message) async {
    final uid = FirebaseAuth.instance.currentUser.uid;
    String url = '';

    if (message.mediaFiles.isNotEmpty) {
      await Future.forEach(message.mediaFiles, (File element) async {
        final fileData = await FirebaseStorage.instance
            .ref('chatFiles/$uid/${DateTime.now().toIso8601String()}')
            .putFile(element);
        url = await fileData.ref.getDownloadURL();
      }).then((_) async {
        final initiator = FirebaseFirestore.instance
            .collection('chats')
            .doc(uid + '_' + userId);
        final receiver = FirebaseFirestore.instance
            .collection('chats')
            .doc(userId + '_' + uid);

        initiator.get().then((value) => {
              if (value.exists)
                {
                  initiator.update({
                    'latestMessage':
                        message.message.isNotEmpty ? message.message : 'photo',
                    'sentAt': Timestamp.now(),
                    'sentBy': uid,
                  }),
                  initiator.collection('messages').doc().set({
                    'message':
                        message.message.isNotEmpty ? message.message : 'photo',
                    'sender': uid,
                    'to': userId,
                    'media': url,
                    'mediaType': message.mediaType,
                    'isRead': false,
                    'sentAt': Timestamp.now()
                  })
                }
              else
                {
                  receiver.get().then((value) => {
                        if (value.exists)
                          {
                            receiver.update({
                              'latestMessage': message.message.isNotEmpty
                                  ? message.message
                                  : 'photo',
                              'sentAt': Timestamp.now(),
                              'sentBy': uid,
                            }),
                            receiver.collection('messages').doc().set({
                              'message': message.message.isNotEmpty
                                  ? message.message
                                  : 'photo',
                              'sender': uid,
                              'to': userId,
                              'media': url,
                              'mediaType': message.mediaType,
                              'isRead': false,
                              'sentAt': Timestamp.now()
                            })
                          }
                        else
                          {
                            initiator.set({
                              'initiator': uid,
                              'receiver': userId,
                              'startedAt': Timestamp.now(),
                              'latestMessage': message.message.isNotEmpty
                                  ? message.message
                                  : '',
                              'sentAt': Timestamp.now(),
                              'sentBy': uid,
                            }),
                            initiator.collection('messages').doc().set({
                              'message': message.message ?? '',
                              'sender': uid,
                              'to': userId,
                              'media': url,
                              'mediaType': message.mediaType,
                              'isRead': false,
                              'sentAt': Timestamp.now()
                            }),
                          }
                      })
                }
            });
      });
    } else {
      final initiator = FirebaseFirestore.instance
          .collection('chats')
          .doc(uid + '_' + userId);
      final receiver = FirebaseFirestore.instance
          .collection('chats')
          .doc(userId + '_' + uid);

      initiator.get().then((value) => {
            if (value.exists)
              {
                initiator.update({
                  'latestMessage': message.message ?? 'photo',
                  'sentAt': Timestamp.now(),
                  'sentBy': uid,
                }),
                initiator.collection('messages').doc().set({
                  'message': message.message ?? '',
                  'sender': uid,
                  'to': userId,
                  'media': url,
                  'mediaType': message.mediaType,
                  'isRead': false,
                  'sentAt': Timestamp.now()
                })
              }
            else
              {
                receiver.get().then((value) => {
                      if (value.exists)
                        {
                          receiver.update({
                            'latestMessage': message.message ?? 'photo',
                            'sentAt': Timestamp.now(),
                            'sentBy': uid,
                          }),
                          receiver.collection('messages').doc().set({
                            'message': message.message ?? '',
                            'sender': uid,
                            'to': userId,
                            'media': url,
                            'mediaType': message.mediaType,
                            'isRead': false,
                            'sentAt': Timestamp.now()
                          })
                        }
                      else
                        {
                          initiator.set({
                            'initiator': uid,
                            'receiver': userId,
                            'startedAt': Timestamp.now(),
                            'latestMessage': message.message ?? '',
                            'sentAt': Timestamp.now(),
                            'sentBy': uid,
                          }),
                          initiator.collection('messages').doc().set({
                            'message': message.message ?? '',
                            'sender': uid,
                            'media': url,
                            'to': userId,
                            'mediaType': message.mediaType,
                            'isRead': false,
                            'sentAt': Timestamp.now()
                          }),
                        }
                    })
              }
          });
    }
  }

  //////////////////////////////////////////////////////
  ///
  ///
  Future<List<ChatTileModel>> getChats() async {
    final uid = FirebaseAuth.instance.currentUser.uid;
    List<ChatTileModel> users = [];

    final initiatorChats = await FirebaseFirestore.instance
        .collection('chats')
        .where('initiator', isEqualTo: uid)
        .get();
    final receiverChats = await FirebaseFirestore.instance
        .collection('chats')
        .where('receiver', isEqualTo: uid)
        .get();

    await Future.forEach(initiatorChats.docs,
        (QueryDocumentSnapshot element) async {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(element['receiver'])
          .get()
          .then((value) => {
                // print(value['username']),
                if (value.exists)
                  {
                    users.add(
                      ChatTileModel(
                          chatRoomId: element.id,
                          latestMessageSenderId: element['sentBy'],
                          user: UserModel.fromJson(value),
                          latestMessage: element['latestMessage'],
                          time: element['sentAt']),
                    ),
                  }
              });
    });

    await Future.forEach(receiverChats.docs,
        (QueryDocumentSnapshot element) async {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(element['initiator'])
          .get()
          .then((value) => {
                if (value.exists)
                  {
                    if (users.where((e) => e.chatRoomId == element.id).isEmpty)
                      users.add(
                        ChatTileModel(
                            chatRoomId: element.id,
                            latestMessageSenderId: element['sentBy'],
                            user: UserModel.fromJson(value),
                            latestMessage: element['latestMessage'],
                            time: element['sentAt']),
                      ),
                  }
              });
    });
    users.sort((a, b) => b.time.compareTo(a.time));

    notifyListeners();
    return _contactedUsers = users;
  }

  Future<List<ChatTileModel>> searchUser(String searchTerm) async {
    List<UserModel> users = [];

    final results = await FirebaseFirestore.instance.collection('users').get();
    results.docs
        .where((element) =>
            element['fullName']
                .toLowerCase()
                .contains(searchTerm.toLowerCase()) ||
            element['phoneNumber']
                .toLowerCase()
                .contains(searchTerm.toLowerCase()) ||
            element['fullName']
                .toLowerCase()
                .contains(searchTerm.toLowerCase()))
        .forEach((e) {
      users.add(UserModel.fromJson(e));
    });
    print(users.length);

    notifyListeners();
    _contactedUsers =
        users.map((e) => ChatTileModel(user: e, chatRoomId: '')).toList();

    return users.map((e) => ChatTileModel(user: e, chatRoomId: '')).toList();
  }
}
