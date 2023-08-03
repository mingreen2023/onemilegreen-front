import 'package:onemilegreen_front/models/base_model.dart';

class RoutineAuthResult extends BaseModel {
  final String result;

  RoutineAuthResult({
    required int code,
    required String message,
    required this.result,
  }) : super(code: code, message: message);

  factory RoutineAuthResult.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return RoutineAuthResult(
      code: json['code'],
      message: json['message'],
      result: data['result'],
    );
  }
}
