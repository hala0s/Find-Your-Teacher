// To parse this JSON data, do
//
//     final teacherAfterFilterModel = teacherAfterFilterModelFromJson(jsonString);

import 'dart:convert';

TeacherAfterFilterModel teacherAfterFilterModelFromJson(String str) => TeacherAfterFilterModel.fromJson(json.decode(str));

String teacherAfterFilterModelToJson(TeacherAfterFilterModel data) => json.encode(data.toJson());

class TeacherAfterFilterModel {
  List<User> users;
  int totalCount;
  int documentCount;

  TeacherAfterFilterModel({
    required this.users,
    required this.totalCount,
    required this.documentCount,
  });

  factory TeacherAfterFilterModel.fromJson(Map<String, dynamic> json) => TeacherAfterFilterModel(
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    totalCount: json["totalCount"],
    documentCount: json["documentCount"],
  );

  Map<String, dynamic> toJson() => {
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
    "totalCount": totalCount,
    "documentCount": documentCount,
  };
}

class User {
  String id;
  ProfilePhoto profilePhoto;
  String userName;
  String phoneNumber;
  String gender;
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
  bool isGifted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String userId;

  User({
    required this.id,
    required this.profilePhoto,
    required this.userName,
    required this.phoneNumber,
    required this.gender,
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
    required this.isGifted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.userId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    profilePhoto: ProfilePhoto.fromJson(json["profilePhoto"]),
    userName: json["userName"],
    phoneNumber: json["phoneNumber"],
    gender: json["gender"],
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
    isGifted: json["isGifted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    userId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "profilePhoto": profilePhoto.toJson(),
    "userName": userName,
    "phoneNumber": phoneNumber,
    "gender": gender,
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
    "isGifted": isGifted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": userId,
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
