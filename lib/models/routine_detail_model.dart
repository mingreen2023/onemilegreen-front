import 'package:onemilegreen_front/models/routine_my_cal_model.dart';

class RoutineDetailModel {
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

  RoutineDetailModel({
    this.rouId = -1,
    this.rouName = "   ",
    this.rouStDate = "          ",
    this.rouEndDate = "          ",
    this.rouMileage = 0,
    this.rouContent = "",
    this.rouEffect = "",
    this.rouDayofweek = "",
    this.rouUserCount = 0,
    this.rouPassImg = "",
    this.rouNpImg = "",
    this.rouDesc = "",
    this.isFavorite = 0,
    this.isJoined = 0,
    this.rouDetailList,
  });

  factory RoutineDetailModel.fromJson(Map<String, dynamic> json) {
    var list = json['rou_detail_list'] as List?;
    List<RoutineCalendarModel>? routineDetailList =
        list?.map((i) => RoutineCalendarModel.fromJson(i)).toList();
    return RoutineDetailModel(
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
