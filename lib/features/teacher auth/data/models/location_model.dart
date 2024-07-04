// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LocationModel locationModelFromJson(String str) =>
    LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  final User user;

  LocationModel({
    required this.user,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  final List<String> locations;

  User({
    required this.locations,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        locations: List<String>.from(json["locations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "locations": List<String>.from(locations.map((x) => x)),
      };
}
