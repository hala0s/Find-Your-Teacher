import 'dart:convert';

class TeacherActivateModel {
  final String message;
  final bool user;

  TeacherActivateModel({
    required this.message,
    required this.user,
  });

  TeacherActivateModel copyWith({
    String? message,
    bool? user,
  }) =>
      TeacherActivateModel(
        message: message ?? this.message,
        user: user ?? this.user,
      );

  factory TeacherActivateModel.fromRawJson(String str) => TeacherActivateModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TeacherActivateModel.fromJson(Map<String, dynamic> json) => TeacherActivateModel(
    message: json["message"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user,
  };
}
