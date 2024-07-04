// To parse this JSON data, do
//
//     final notificationModels = notificationModelsFromJson(jsonString);

import 'dart:convert';

NotificationStudentModels notificationModelsFromJson(String str) => NotificationStudentModels.fromJson(json.decode(str));

String notificationModelsToJson(NotificationStudentModels data) => json.encode(data.toJson());

class NotificationStudentModels {
  List<Notification> notifications;

  NotificationStudentModels({
    required this.notifications,
  });

  factory NotificationStudentModels.fromJson(Map<String, dynamic> json) => NotificationStudentModels(
    notifications: List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
  };
}

class Notification {
  String title;
  String body;

  Notification({
    required this.title,
    required this.body,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
  };
}
