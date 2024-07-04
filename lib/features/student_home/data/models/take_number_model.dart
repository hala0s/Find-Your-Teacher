
import 'dart:convert';

TakeNumberModel takeNumberModelFromJson(String str) => TakeNumberModel.fromJson(json.decode(str));

String takeNumberModelToJson(TakeNumberModel data) => json.encode(data.toJson());

class TakeNumberModel {
  String message;

  TakeNumberModel({
    required this.message,
  });

  factory TakeNumberModel.fromJson(Map<String, dynamic> json) => TakeNumberModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
