import 'package:odoo/data/models/task_models.dart';

class TimersData {
  TimersData({
    required this.name,
    required this.deadline,
    required this.details,
    required this.taskdetails,
    this.isFav,
    this.createdAt,
  });
  String name;
  String deadline;
  String details;
  bool? isFav;
  DateTime? createdAt;
  TaskData taskdetails;

  factory TimersData.fromJSON(Map<String, dynamic> json) {
    return TimersData(
      name: json['name'],
      deadline: json['deadline'],
      details: json['details'],
      isFav: json['isFav'],
      taskdetails: json['taskdetails'],
      createdAt:
          json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'name': name,
      'deadline': deadline,
      'details': details,
      'taskdetails': taskdetails,
      'isFav': isFav,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  map(TimersData Function(dynamic json) param0) {}
}
