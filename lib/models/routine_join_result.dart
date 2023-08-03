import 'package:onemilegreen_front/models/base_model.dart';

class RoutineJoinResultModel extends BaseModel {
  @override
  final int code;
  @override
  final String message;
  final String result;
  final int routineId;
  final String routineTitle;

  RoutineJoinResultModel({
    required this.code,
    required this.message,
    required this.result,
    required this.routineId,
    required this.routineTitle,
  }) : super(code: code, message: message);

  factory RoutineJoinResultModel.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return RoutineJoinResultModel(
      code: json['code'],
      message: json['message'],
      result: data['result'],
      routineId: data['routineId'],
      routineTitle: data['routineTitle'],
    );
  }
}
