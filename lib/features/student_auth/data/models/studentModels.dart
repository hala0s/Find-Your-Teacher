// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  final User user;

  AuthModel({
    required this.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
  };
}

class User {
  final String id;
  final ProfilePhoto profilePhoto;
  final String userName;
  final String phoneNumber;
  final String gender;
  final String role;
  final String token;

  User({
    required this.id,
    required this.profilePhoto,
    required this.userName,
    required this.phoneNumber,
    required this.gender,
    required this.role,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    profilePhoto: ProfilePhoto.fromJson(json["profilePhoto"]),
    userName: json["userName"],
    phoneNumber: json["phoneNumber"],
    gender: json["gender"],
    role: json["role"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "profilePhoto": profilePhoto.toJson(),
    "userName": userName,
    "phoneNumber": phoneNumber,
    "gender": gender,
    "role": role,
    "token": token,
  };
}

class ProfilePhoto {
  final String url;
  final String publicId;

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
