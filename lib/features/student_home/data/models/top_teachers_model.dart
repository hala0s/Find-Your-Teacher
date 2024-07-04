// To parse this JSON data, do
//
//     final topTeachersModel = topTeachersModelFromJson(jsonString);

import 'dart:convert';

TopTeachersModel topTeachersModelFromJson(String str) => TopTeachersModel.fromJson(json.decode(str));

String topTeachersModelToJson(TopTeachersModel data) => json.encode(data.toJson());

class TopTeachersModel {
  List<User> users;

  TopTeachersModel({
    required this.users,
  });

  factory TopTeachersModel.fromJson(Map<String, dynamic> json) => TopTeachersModel(
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
  };
}

class User {
  bool isGifted;
  String id;
  ProfilePhoto profilePhoto;
  String userName;
  String phoneNumber;
  List<String> locations;
  List<String> subjects;
  List<String> academicLevel;
  List<String> locationsName;
  List<String> subjectName;
  List<String> academicLevelName;
  String role;
  bool available;
  int count;
  String savedCode;
  bool resetPassword;
  int numberOfTrying;
  List<dynamic> numberRequired;
  int price;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? aboutMe;
  String userId;
  String? gender;

  User({
    required this.isGifted,
    required this.id,
    required this.profilePhoto,
    required this.userName,
    required this.phoneNumber,
    required this.locations,
    required this.subjects,
    required this.academicLevel,
    required this.locationsName,
    required this.subjectName,
    required this.academicLevelName,
    required this.role,
    required this.available,
    required this.count,
    required this.savedCode,
    required this.resetPassword,
    required this.numberOfTrying,
    required this.numberRequired,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.aboutMe,
    required this.userId,
    this.gender,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    isGifted: json["isGifted"],
    id: json["_id"],
    profilePhoto: ProfilePhoto.fromJson(json["profilePhoto"]),
    userName: json["userName"],
    phoneNumber: json["phoneNumber"],
    locations: List<String>.from(json["locations"].map((x) => x)),
    subjects: List<String>.from(json["subjects"].map((x) => x)),
    academicLevel: List<String>.from(json["academicLevel"].map((x) => x)),
    locationsName: List<String>.from(json["locationsName"].map((x) => x)),
    subjectName: List<String>.from(json["subjectName"].map((x) => x)),
    academicLevelName: List<String>.from(json["academicLevelName"].map((x) => x)),
    role: json["role"],
    available: json["available"],
    count: json["count"],
    savedCode: json["savedCode"],
    resetPassword: json["resetPassword"],
    numberOfTrying: json["numberOfTrying"],
    numberRequired: List<dynamic>.from(json["numberRequired"].map((x) => x)),
    price: json["price"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    aboutMe: json["aboutMe"],
    userId: json["id"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "isGifted": isGifted,
    "_id": id,
    "profilePhoto": profilePhoto.toJson(),
    "userName": userName,
    "phoneNumber": phoneNumber,
    "locations": List<dynamic>.from(locations.map((x) => x)),
    "subjects": List<dynamic>.from(subjects.map((x) => x)),
    "academicLevel": List<dynamic>.from(academicLevel.map((x) => x)),
    "locationsName": List<dynamic>.from(locationsName.map((x) => x)),
    "subjectName": List<dynamic>.from(subjectName.map((x) => x)),
    "academicLevelName": List<dynamic>.from(academicLevelName.map((x) => x)),
    "role": role,
    "available": available,
    "count": count,
    "savedCode": savedCode,
    "resetPassword": resetPassword,
    "numberOfTrying": numberOfTrying,
    "numberRequired": List<dynamic>.from(numberRequired.map((x) => x)),
    "price": price,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "aboutMe": aboutMe,
    "id": userId,
    "gender": gender,
  };
}

class ProfilePhoto {
  String url;
  String publicId;

  ProfilePhoto({
    required this.url,
    required this.publicId,
  });

  factory ProfilePhoto.fromJson(Map<String, dynamic> json) => ProfilePhoto(
    url: json["url"],
    publicId: json["publicId"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "publicId": publicId,
  };
}
