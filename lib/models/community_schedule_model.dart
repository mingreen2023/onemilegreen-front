import 'package:onemilegreen_front/models/base_model.dart';

class ScheduleData extends BaseModel {
  final List<ScheduleListItem> scheduleLists;

  ScheduleData({
    required int code,
    required String message,
    required this.scheduleLists,
  }) : super(code: code, message: message);

  factory ScheduleData.fromJson(Map<String, dynamic> json) {
    var list = json['data']['scheduleLists'] as List;
    List<ScheduleListItem> scheduleList =
        list.map((i) => ScheduleListItem.fromJson(i)).toList();

    return ScheduleData(
      code: json['code'],
      message: json['message'],
      scheduleLists: scheduleList,
    );
  }
}

class ScheduleListItem {
  final String schName;
  final String schStDate;
  final String schEndDate;
  final int joinpeople;
  final int schMaxMem;

  ScheduleListItem({
    required this.schName,
    required this.schStDate,
    required this.schEndDate,
    required this.joinpeople,
    required this.schMaxMem,
  });

  factory ScheduleListItem.fromJson(Map<String, dynamic> json) {
    return ScheduleListItem(
      schName: json['sch_name'],
      schStDate: json['sch_st_date'],
      schEndDate: json['sch_end_date'],
      joinpeople: json['joinpeople'],
      schMaxMem: json['sch_max_mem'],
    );
  }
}
