import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String id;
  String userId;
  String title;
  String description;
  bool isDone;
  int date;
  Timestamp timestamp;

  TaskModel({
    this.id = '',
    this.isDone = false,
    required this.userId,
    required this.title,
    required this.description,
    required this.date,
    required this.timestamp,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          userId: json['userId'],
          title: json['title'],
          description: json['description'],
          isDone: json['isDone'],
          date: json['date'],
          timestamp: json['timestamp'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'isDone': isDone,
      'date': date,
      'timestamp': timestamp,
    };
  }
}
