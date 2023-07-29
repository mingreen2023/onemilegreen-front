import 'package:onemilegreen_front/models/routine_my_cal_model.dart';

class RoutineModel {
  final int rouId;
  final String rouName;
  final String rouStDate;
  final String rouEndDate;
  final int rouMileage;
  final String rouContent;
  final String rouEffect;
  final String rouDayofweek;
  final int rouUserCount;
  final int isFavorite;
  final int isJoined;

  RoutineModel({
    required this.rouId,
    required this.rouName,
    required this.rouStDate,
    required this.rouEndDate,
    required this.rouMileage,
    required this.rouContent,
    required this.rouEffect,
    required this.rouDayofweek,
    required this.rouUserCount,
    required this.isFavorite,
    required this.isJoined,
  });

  factory RoutineModel.fromJson(Map<String, dynamic> json) {
    var list = json['rou_detail_list'] as List?;
    List<RoutineCalendarModel>? routineDetailList =
        list?.map((i) => RoutineCalendarModel.fromJson(i)).toList();
    return RoutineModel(
      rouId: json['rou_id'],
      rouName: json['rou_name'],
      rouStDate: json['rou_st_date'],
      rouEndDate: json['rou_end_date'],
      rouMileage: json['rou_mileage'],
      rouContent: json['rou_content'],
      rouEffect: json['rou_effect'],
      rouDayofweek: json['rou_dayofweek'],
      rouUserCount: json['rou_user_count'],
      isFavorite: json['is_favorite'],
      isJoined: json['is_joined'],
    );
  }
}
