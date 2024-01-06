class TaskData {
  final String description;
  final String date;
  final String startTime;
  final String duration;
  final String day;
  final String project;
  final String deadline;
  final String assignedTo;
  TaskData({
    required this.date,
    required this.day,
    required this.description,
    required this.duration,
    required this.startTime,
    required this.assignedTo,
    required this.deadline,
    required this.project,
  });
}
