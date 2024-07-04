// To parse this JSON data, do
//
//     final getStudentSubjectsModel = getStudentSubjectsModelFromJson(jsonString);

import 'dart:convert';

GetStudentSubjectsModel getStudentSubjectsModelFromJson(String str) => GetStudentSubjectsModel.fromJson(json.decode(str));

String getStudentSubjectsModelToJson(GetStudentSubjectsModel data) => json.encode(data.toJson());

class GetStudentSubjectsModel {
  List<Subject> subjects;
  int totalCount;
  int documentCount;

  GetStudentSubjectsModel({
    required this.subjects,
    required this.totalCount,
    required this.documentCount,
  });

  factory GetStudentSubjectsModel.fromJson(Map<String, dynamic> json) => GetStudentSubjectsModel(
    subjects: List<Subject>.from(json["subjects"].map((x) => Subject.fromJson(x))),
    totalCount: json["totalCount"],
    documentCount: json["documentCount"],
  );

  Map<String, dynamic> toJson() => {
    "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
    "totalCount": totalCount,
    "documentCount": documentCount,
  };
}

class Subject {
  CtImage subjectImage;
  String id;
  CtImage? productImage;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<User> users;
  String subjectId;

  Subject({
    required this.subjectImage,
    required this.id,
    this.productImage,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.users,
    required this.subjectId,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    subjectImage: CtImage.fromJson(json["subjectImage"]),
    id: json["_id"],
    productImage: json["productImage"] == null ? null : CtImage.fromJson(json["productImage"]),
    name: json["name"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    subjectId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "subjectImage": subjectImage.toJson(),
    "_id": id,
    "productImage": productImage?.toJson(),
    "name": name,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
    "id": subjectId,
  };
}

class CtImage {
  String url;
  String? publicId;

  CtImage({
    required this.url,
    required this.publicId,
  });

  factory CtImage.fromJson(Map<String, dynamic> json) => CtImage(
    url: json["url"],
    publicId: json["publicId"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "publicId": publicId,
  };
}

class User {
  String id;
  List<String> subjects;
  String userId;

  User({
    required this.id,
    required this.subjects,
    required this.userId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    subjects: List<String>.from(json["subjects"].map((x) => x)),
    userId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "subjects": List<dynamic>.from(subjects.map((x) => x)),
    "id": userId,
  };
}
