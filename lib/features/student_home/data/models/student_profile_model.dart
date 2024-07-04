import 'dart:convert';

import 'package:equatable/equatable.dart';

class StudentProfileModel extends Equatable {
  final String userName;
  final int count;
  final String role;

  StudentProfileModel({
    required this.userName,
    required this.count,
    required this.role,
  });

  factory StudentProfileModel.fromRawJson(String str) => StudentProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentProfileModel.fromJson(Map<String, dynamic> json) => StudentProfileModel(
    userName: json["userName"],
    count: json["count"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "count": count,
    "role": role,
  };

  @override
  List<Object?> get props =>[userName, count, role];
}
