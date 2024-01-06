import 'package:odoo/data/models/task_models.dart';

class TimersData {
  TimersData({
    required this.name,
    required this.deadline,
    required this.details,
    required this.taskdetails,
  });
  final String name;
  final String deadline;
  final String details;
  final TaskData taskdetails;
}
