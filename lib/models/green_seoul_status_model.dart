import 'package:onemilegreen_front/models/base_model.dart';

class GreenSeoulStatusModel extends BaseModel {
  final int districtTotalMileage;
  final int districtTotalEffect;
  final int districtTotalUser;
  final int districtRanking;
  final int userMileage;
  final int seoulTotalMileage;
  final int seoulTotalEffect;
  final int seoulTotalUser;
  final int userEffect;
  final String districtName;

  GreenSeoulStatusModel({
    required int code,
    required String message,
    required this.districtTotalMileage,
    required this.districtTotalEffect,
    required this.districtTotalUser,
    required this.districtRanking,
    required this.districtName,
    required this.userMileage,
    required this.userEffect,
    required this.seoulTotalMileage,
    required this.seoulTotalEffect,
    required this.seoulTotalUser,
  }) : super(code: code, message: message);

  factory GreenSeoulStatusModel.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return GreenSeoulStatusModel(
      code: json['code'],
      message: json['message'],
      districtTotalMileage: data['districtTotalMileage'],
      districtTotalEffect: data['districtTotalEffect'],
      districtTotalUser: data['districtTotalUser'],
      districtRanking: data['districtRangking'],
      userMileage: data['userMileage'],
      userEffect: data['userEffect'],
      seoulTotalMileage: data['seoulTotalMileage'],
      seoulTotalEffect: data['seoulTotalEffect'],
      seoulTotalUser: data['seoulTotalUser'],
      districtName: data['districtName'],
    );
  }
}
