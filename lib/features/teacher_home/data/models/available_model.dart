import 'dart:convert';

class AvailableModel {
  final User? user;

  AvailableModel({
    this.user,
  });

  AvailableModel copyWith({
    User? user,
  }) =>
      AvailableModel(
        user: user ?? this.user,
      );

  factory AvailableModel.fromRawJson(String str) => AvailableModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AvailableModel.fromJson(Map<String, dynamic> json) => AvailableModel(
    user: json["user"] != null ? User.fromJson(json["user"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
  };
}

class User {
  final String? id;
  final ProfilePhoto? profilePhoto;
  final String? userName;
  final String? phoneNumber;
  final String? gender;
  final List<String>? locations;
  final List<String>? subjects;
  final List<dynamic>? academicLevel;
  final List<String>? locationsName;
  final List<String>? subjectName;
  final List<dynamic>? academicLevelName;
  final String? role;
  final bool? available;
  final int? count;
  final String? savedCode;
  final bool? resetPassword;
  final int? numberOfTrying;
  final String? fcmToken;
  final List<dynamic>? numberRequired;
  final int? price;
  final bool? isGifted;
  final bool? isOk;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final DateTime? birthday;
  final String? aboutMe;
  final String? userId;

  User({
    this.id,
    this.profilePhoto,
    this.userName,
    this.phoneNumber,
    this.gender,
    this.locations,
    this.subjects,
    this.academicLevel,
    this.locationsName,
    this.subjectName,
    this.academicLevelName,
    this.role,
    this.available,
    this.count,
    this.savedCode,
    this.resetPassword,
    this.numberOfTrying,
    this.fcmToken,
    this.numberRequired,
    this.price,
    this.isGifted,
    this.isOk,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.birthday,
    this.aboutMe,
    this.userId,
  });

  User copyWith({
    String? id,
    ProfilePhoto? profilePhoto,
    String? userName,
    String? phoneNumber,
    String? gender,
    List<String>? locations,
    List<String>? subjects,
    List<dynamic>? academicLevel,
    List<String>? locationsName,
    List<String>? subjectName,
    List<dynamic>? academicLevelName,
    String? role,
    bool? available,
    int? count,
    String? savedCode,
    bool? resetPassword,
    int? numberOfTrying,
    String? fcmToken,
    List<dynamic>? numberRequired,
    int? price,
    bool? isGifted,
    bool? isOk,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    DateTime? birthday,
    String? aboutMe,
    String? userId,
  }) =>
      User(
        id: id ?? this.id,
        profilePhoto: profilePhoto ?? this.profilePhoto,
        userName: userName ?? this.userName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        gender: gender ?? this.gender,
        locations: locations ?? this.locations,
        subjects: subjects ?? this.subjects,
        academicLevel: academicLevel ?? this.academicLevel,
        locationsName: locationsName ?? this.locationsName,
        subjectName: subjectName ?? this.subjectName,
        academicLevelName: academicLevelName ?? this.academicLevelName,
        role: role ?? this.role,
        available: available ?? this.available,
        count: count ?? this.count,
        savedCode: savedCode ?? this.savedCode,
        resetPassword: resetPassword ?? this.resetPassword,
        numberOfTrying: numberOfTrying ?? this.numberOfTrying,
        fcmToken: fcmToken ?? this.fcmToken,
        numberRequired: numberRequired ?? this.numberRequired,
        price: price ?? this.price,
        isGifted: isGifted ?? this.isGifted,
        isOk: isOk ?? this.isOk,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        birthday: birthday ?? this.birthday,
        aboutMe: aboutMe ?? this.aboutMe,
        userId: userId ?? this.userId,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    profilePhoto: json["profilePhoto"] != null ? ProfilePhoto.fromJson(json["profilePhoto"]) : null,
    userName: json["userName"],
    phoneNumber: json["phoneNumber"],
    gender: json["gender"],
    locations: json["locations"] != null ? List<String>.from(json["locations"].map((x) => x)) : null,
    subjects: json["subjects"] != null ? List<String>.from(json["subjects"].map((x) => x)) : null,
    academicLevel: json["academicLevel"] != null ? List<dynamic>.from(json["academicLevel"].map((x) => x)) : null,
    locationsName: json["locationsName"] != null ? List<String>.from(json["locationsName"].map((x) => x)) : null,
    subjectName: json["subjectName"] != null ? List<String>.from(json["subjectName"].map((x) => x)) : null,
    academicLevelName: json["academicLevelName"] != null ? List<dynamic>.from(json["academicLevelName"].map((x) => x)) : null,
    role: json["role"],
    available: json["available"],
    count: json["count"],
    savedCode: json["savedCode"],
    resetPassword: json["resetPassword"],
    numberOfTrying: json["numberOfTrying"],
    fcmToken: json["fcmToken"],
    numberRequired: json["numberRequired"] != null ? List<dynamic>.from(json["numberRequired"].map((x) => x)) : null,
    price: json["price"],
    isGifted: json["isGifted"],
    isOk: json["isOk"],
    createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
    updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
    v: json["__v"],
    birthday: json["birthday"] != null ? DateTime.parse(json["birthday"]) : null,
    aboutMe: json["aboutMe"],
    userId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "profilePhoto": profilePhoto?.toJson(),
    "userName": userName,
    "phoneNumber": phoneNumber,
    "gender": gender,
    "locations": locations != null ? List<dynamic>.from(locations!.map((x) => x)) : null,
    "subjects": subjects != null ? List<dynamic>.from(subjects!.map((x) => x)) : null,
    "academicLevel": academicLevel != null ? List<dynamic>.from(academicLevel!.map((x) => x)) : null,
    "locationsName": locationsName != null ? List<dynamic>.from(locationsName!.map((x) => x)) : null,
    "subjectName": subjectName != null ? List<dynamic>.from(subjectName!.map((x) => x)) : null,
    "academicLevelName": academicLevelName != null ? List<dynamic>.from(academicLevelName!.map((x) => x)) : null,
    "role": role,
    "available": available,
    "count": count,
    "savedCode": savedCode,
    "resetPassword": resetPassword,
    "numberOfTrying": numberOfTrying,
    "fcmToken": fcmToken,
    "numberRequired": numberRequired != null ? List<dynamic>.from(numberRequired!.map((x) => x)) : null,
    "price": price,
    "isGifted": isGifted,
    "isOk": isOk,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "birthday": birthday != null ? "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}" : null,
    "aboutMe": aboutMe,
    "id": userId,
  };
}

class ProfilePhoto {
  final String? url;
  final String? publicId;

  ProfilePhoto({
    this.url,
    this.publicId,
  });

  ProfilePhoto copyWith({
    String? url,
    String? publicId,
  }) =>
      ProfilePhoto(
        url: url ?? this.url,
        publicId: publicId ?? this.publicId,
      );

  factory ProfilePhoto.fromRawJson(String str) => ProfilePhoto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfilePhoto.fromJson(Map<String, dynamic> json) => ProfilePhoto(
    url: json["url"],
    publicId: json["publicId"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "publicId": publicId,
  };
}
