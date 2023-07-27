import 'package:onemilegreen_front/models/routine_my_cal_model.dart';

class Routine {
  final int rouId;
  final String rouName;
  final String rouStDate;
  final String rouEndDate;
  final int rouMileage;
  final String rouContent;
  final String rouEffect;
  final String rouDayofweek;
  final int rouUserCount;
  final String rouPassImg;
  final String rouNpImg;
  final String rouDesc;
  final int? isFavorite;
  final int? isJoined;
  final List<RoutineCalendarModel>? rouDetailList;

  Routine({
    required this.rouId,
    required this.rouName,
    required this.rouStDate,
    required this.rouEndDate,
    required this.rouMileage,
    required this.rouContent,
    required this.rouEffect,
    required this.rouDayofweek,
    required this.rouUserCount,
    required this.rouPassImg,
    required this.rouNpImg,
    required this.rouDesc,
    this.isFavorite,
    this.isJoined,
    this.rouDetailList,
  });

  factory Routine.fromJson(Map<String, dynamic> json) {
    var list = json['rou_detail_list'] as List?;
    List<RoutineCalendarModel>? routineDetailList =
        list?.map((i) => RoutineCalendarModel.fromJson(i)).toList();
    return Routine(
      rouId: json['rou_id'],
      rouName: json['rou_name'],
      rouStDate: json['rou_st_date'],
      rouEndDate: json['rou_end_date'],
      rouMileage: json['rou_mileage'],
      rouContent: json['rou_content'],
      rouEffect: json['rou_effect'],
      rouDayofweek: json['rou_dayofweek'],
      rouUserCount: json['rou_user_count'],
      rouPassImg: json['rou_pass_img'],
      rouNpImg: json['rou_np_img'],
      rouDesc: json['rou_desc'],
      isFavorite: json['is_favorite'],
      isJoined: json['is_joined'],
      rouDetailList: routineDetailList,
    );
  }
}
