import 'dart:convert';

class LocationSearchModel {
  final List<Location> locations;

  LocationSearchModel({
    required this.locations,

  });

  factory LocationSearchModel.fromRawJson(String str) => LocationSearchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationSearchModel.fromJson(Map<String, dynamic> json) => LocationSearchModel(
    locations: List<Location>.from(json["locations"].map((x) => Location.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "locations": List<dynamic>.from(locations.map((x) => x.toJson())),

  };
}

class Location {
  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String locationId;

  Location({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.locationId,
  });

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["_id"],
    name: json["name"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    locationId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": locationId,
  };
}
