import 'package:onemilegreen_front/models/routine_detail_model.dart';

class WeekCalendar {
  final DateTime startDate;
  final DateTime endDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final List<Week> weeks;
  final RoutineDetailModel? routineDetailModel;
  Map<String, int> routineStatusMap = {};

  WeekCalendar({
    required this.startDate,
    required this.endDate,
    required this.firstDate,
    required this.lastDate,
    required this.weeks,
    this.routineDetailModel,
  }) {
    routineDetailModel?.rouDetailList?.forEach((routineCalendarModel) {
      routineStatusMap[routineCalendarModel.date] = routineCalendarModel.status;
    });
  }
}

class Week {
  final int weekNumber;
  final String month;
  final List<Day> days;

  Week({
    required this.weekNumber,
    required this.month,
    required this.days,
  });
}

class Day {
  final DateTime date;
  final String imageAsset;
  bool selDate;

  Day({required this.date, required this.imageAsset, this.selDate = false});
}
