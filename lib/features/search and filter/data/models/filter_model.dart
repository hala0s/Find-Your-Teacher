import 'dart:convert';

FilterModel filterModelFromJson(String str) => FilterModel.fromJson(json.decode(str));

String filterModelToJson(FilterModel data) => json.encode(data.toJson());

class FilterModel {
  List<AcademicLevel?> subjects;
  List<AcademicLevel?> locations;
  List<AcademicLevel?> academicLevel;

  FilterModel({
    required this.subjects,
    required this.locations,
    required this.academicLevel,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
    subjects: List<AcademicLevel?>.from(json["subjects"].map((x) => AcademicLevel.fromJson(x))),
    locations: List<AcademicLevel?>.from(json["locations"].map((x) => AcademicLevel.fromJson(x))),
    academicLevel: List<AcademicLevel?>.from(json["academicLevel"].map((x) => AcademicLevel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subjects": List<dynamic>.from(subjects.map((x) => x?.toJson())),
    "locations": List<dynamic>.from(locations.map((x) => x?.toJson())),
    "academicLevel": List<dynamic>.from(academicLevel.map((x) => x?.toJson())),
  };
}

class AcademicLevel {
  String id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String academicLevelId;
  CtImage? subjectImage;
  CtImage? productImage;

  AcademicLevel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.academicLevelId,
    this.subjectImage,
    this.productImage,
  });

  factory AcademicLevel.fromJson(Map<String, dynamic> json) => AcademicLevel(
    id: json["_id"],
    name: json["name"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    academicLevelId: json["id"] ??"",
    subjectImage: json["subjectImage"] == null ? null : CtImage.fromJson(json["subjectImage"]),
    productImage: json["productImage"] == null ? null : CtImage.fromJson(json["productImage"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": academicLevelId,
    "subjectImage": subjectImage?.toJson(),
    "productImage": productImage?.toJson(),
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
