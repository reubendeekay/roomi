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
      this.attributes,
      this.isAdmin,
      this.isLandlord});
  String id;
  String imgAvt;
  String name;
  int age;
  String dateOfBirth;
  bool gender;
  String type;
  String aboutUser;
  List questionnaires;
  Map<String, dynamic> attributes;
  String site;
  String email;
  String phoneNumber;
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
        'attributes': attributes,
        'dateOfBirth': dateOfBirth,
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
      attributes: json['attributes'],
      dateOfBirth: json['dateOfBirth'],
    );
  }
}
