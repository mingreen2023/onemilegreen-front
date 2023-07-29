import 'package:onemilegreen_front/models/base_model.dart';

class RoutineJoinResultModel extends BaseModel {
  RoutineJoinResultModel({
    required int code,
    required String message,
    required String result,
    required int routineId,
  }) : super(code: code, message: message);

  factory RoutineJoinResultModel.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return RoutineJoinResultModel(
      code: json['code'],
      message: json['message'],
      result: data['result'],
      routineId: data['routineId'],
    );
  }
}
