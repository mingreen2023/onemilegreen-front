import 'package:onemilegreen_front/models/base_model.dart';
import 'package:onemilegreen_front/models/routine_base_model.dart';

class SingleRoutineModel extends BaseModel {
  final Routine routine;

  SingleRoutineModel({
    required int code,
    required String message,
    required this.routine,
  }) : super(code: code, message: message);

  factory SingleRoutineModel.fromJson(Map<String, dynamic> json) {
    return SingleRoutineModel(
      code: json['code'],
      message: json['message'],
      routine: Routine.fromJson(json['data']['routine']),
    );
  }
}
