import 'package:onemilegreen_front/models/base_model.dart';
import 'package:onemilegreen_front/models/routine_base_model.dart';

class RoutineListModel extends BaseModel {
  final List<RoutineModel> popularRoutineList;
  final List<RoutineModel> recommandRoutineList;

  RoutineListModel({
    required int code,
    required String message,
    required this.popularRoutineList,
    required this.recommandRoutineList,
  }) : super(code: code, message: message);

  factory RoutineListModel.fromJson(Map<String, dynamic> json) {
    var popularJsonList = json['data']['popularRoutineList'] as List;
    var recommandJsonList = json['data']['recommandRoutineList'] as List;

    List<RoutineModel> popularList =
        popularJsonList.map((i) => RoutineModel.fromJson(i)).toList();
    List<RoutineModel> recommandList =
        recommandJsonList.map((i) => RoutineModel.fromJson(i)).toList();
    return RoutineListModel(
      code: json['code'],
      message: json['message'],
      popularRoutineList: popularList,
      recommandRoutineList: recommandList,
    );
  }
}
