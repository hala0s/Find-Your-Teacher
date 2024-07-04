// To parse this JSON data, do
//
//     final notificationModels = notificationModelsFromJson(jsonString);

import 'dart:convert';

NotificationModels notificationModelsFromJson(String str) => NotificationModels.fromJson(json.decode(str));

String notificationModelsToJson(NotificationModels data) => json.encode(data.toJson());

class NotificationModels {
  List<Notification> notifications;

  NotificationModels({
    required this.notifications,
  });

  factory NotificationModels.fromJson(Map<String, dynamic> json) => NotificationModels(
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
