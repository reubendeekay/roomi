import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoder2/geocoder2.dart';

class PostModel {
  PostModel({
    this.id,
    this.images,
    this.title,
    this.state,
    this.ammenities,
    this.timeRent,
    this.amountBed,
    this.ownerId,
    this.selected,
    this.currentImage,
    this.type,
    this.location,
    this.rentAmount,
    this.createdAt,
    this.amountBath,
    this.deposit,
    this.description,
    this.prefferedAge,
    this.prefferedGender,
    this.prefferedOccupation,
    this.rules,
  });
  String id;
  String rentAmount;
  String deposit;
  List<dynamic> images;
  int amountBed;
  int amountBath;
  String title;
  String description;
  String state;
  String timeRent;
  String prefferedGender;
  String prefferedAge;
  String prefferedOccupation;

  bool selected;
  String ownerId;
  int currentImage;
  String type;
  GeoPoint location;
  Timestamp createdAt;

  List<dynamic> ammenities = [];
  List<File> imageFiles = [];
  List<dynamic> rules = [];

  factory PostModel.fromJson(dynamic json) {
    return PostModel(
      id: json.id,
      ammenities: json['ammenities'],
      amountBath: json['amountBath'],
      amountBed: json['amountBed'],
      createdAt: json['createdAt'],
      deposit: json['deposit'],
      description: json['description'],
      ownerId: json['ownerId'],
      images: json['images'],
      location: json['location'],
      prefferedAge: json['prefferedAge'],
      prefferedGender: json['prefferedGender'],
      prefferedOccupation: json['prefferedOccupation'],
      rules: json['rules'],
      selected: json['selected'],
      state: json['state'],
      timeRent: json['timeRent'],
      title: json['title'],
      type: json['type'],
      rentAmount: json['rentAmount'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'images': images,
        'title': title,
        'state': state,
        'timeRent': timeRent,
        'amountBed': amountBed,
        'ownerId': ownerId,
        'selected': selected,
        'amountBath': amountBath,
        'createdAt': createdAt,
        'type': type,
        'location': location,
        'rentAmount': rentAmount,
        'deposit': deposit,
        'description': description,
        'prefferedAge': prefferedAge,
        'prefferedGender': prefferedGender,
        'prefferedOccupation': prefferedOccupation,
        'rules': rules,
        'ammenities': ammenities,
      };
}
