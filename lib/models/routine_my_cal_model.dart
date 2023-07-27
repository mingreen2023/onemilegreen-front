class RoutineCalendarModel {
  final String date;
  final int status;

  RoutineCalendarModel({
    required this.date,
    required this.status,
  });

  factory RoutineCalendarModel.fromJson(Map<String, dynamic> json) {
    return RoutineCalendarModel(
      date: json['date'],
      status: json['status'],
    );
  }
}
