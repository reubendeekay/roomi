import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  UserModel(
      {this.id,
      this.imgAvt,
      this.name,
      this.age,
      this.site,
      this.gender,
      this.type,
      this.aboutUser,
      this.email,
      this.password,
      this.createdAt,
      this.phoneNumber,
      this.dateOfBirth,
      this.questionnaires,
      this.imageFile,
      this.prefferedLocation,
      this.occupation,
      this.isAdmin,
      this.isLandlord,
      this.maxRent,
      this.moveInDate,
      this.workPlace,
      this.wishlist});
  String id;
  String imgAvt;
  String name;
  int age;
  File imageFile;
  String dateOfBirth;
  bool gender;
  String type;
  String aboutUser;
  List questionnaires = [];
  List<dynamic> wishlist = [];
  String site;
  String email;
  String prefferedLocation;
  String occupation;
  String phoneNumber;
  String maxRent;
  String workPlace;
  String moveInDate;

  String password;
  Timestamp createdAt;
  bool isLandlord;
  bool isAdmin;

  @override
  List<Object> get props =>
      [id, imgAvt, name, age, gender, type, aboutUser, site];

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'site': site,
        'gender': gender,
        'type': type,
        'about': aboutUser,
        'email': email,
        'phoneNumber': phoneNumber,
        'isLandlord': isLandlord,
        'isAdmin': isAdmin,
        'password': password,
        'userId': id,
        'profilePic': imgAvt,
        'createdAt': createdAt,
        'questionnaires': questionnaires,
        'dateOfBirth': dateOfBirth,
        'prefferedLocation': prefferedLocation,
        'occupation': occupation,
        'maxRent': maxRent,
        'workPlace': workPlace,
        'moveInDate': moveInDate,
        'wishlist': wishlist,
      };

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      id: json['userId'],
      imgAvt: json['profilePic'],
      name: json['name'],
      age: json['age'],
      site: json['site'],
      aboutUser: json['about'],
      email: json['email'],
      gender: json['gender'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      createdAt: json['createdAt'],
      isAdmin: json['isAdmin'],
      isLandlord: json['isLandlord'],
      questionnaires: json['questionnaires'],
      type: json['type'],
      dateOfBirth: json['dateOfBirth'],
      prefferedLocation: json['prefferedLocation'],
      occupation: json['occupation'],
      maxRent: json['maxRent'],
      workPlace: json['workPlace'],
      moveInDate: json['moveInDate'],
      wishlist: json['wishlist'] ?? [],
    );
  }
}
