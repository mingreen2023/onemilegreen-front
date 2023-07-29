import 'package:onemilegreen_front/models/base_model.dart';
import 'package:onemilegreen_front/models/routine_detail_model.dart';

class SingleRoutineModel extends BaseModel {
  final RoutineDetailModel data;

  SingleRoutineModel({
    required int code,
    required String message,
    required this.data,
  }) : super(code: code, message: message);

  factory SingleRoutineModel.fromJson(Map<String, dynamic> json) {
    return SingleRoutineModel(
      code: json['code'],
      message: json['message'],
      data: RoutineDetailModel.fromJson(json['data']),
    );
  }
}
