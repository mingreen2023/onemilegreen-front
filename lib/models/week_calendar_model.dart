class WeekCalendar {
  final DateTime startDate;
  final DateTime endDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final List<Week> weeks;

  WeekCalendar({
    required this.startDate,
    required this.endDate,
    required this.firstDate,
    required this.lastDate,
    required this.weeks,
  });
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
