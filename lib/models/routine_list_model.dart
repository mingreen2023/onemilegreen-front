import 'package:onemilegreen_front/models/base_model.dart';
import 'package:onemilegreen_front/models/routine_base_model.dart';

class PopularRoutineListModel extends BaseModel {
  final List<Routine> popularRoutineList;

  PopularRoutineListModel({
    required int code,
    required String message,
    required this.popularRoutineList,
  }) : super(code: code, message: message);

  factory PopularRoutineListModel.fromJson(Map<String, dynamic> json) {
    var list = json['data']['popularRoutineList'] as List;
    List<Routine> routineList = list.map((i) => Routine.fromJson(i)).toList();
    return PopularRoutineListModel(
      code: json['code'],
      message: json['message'],
      popularRoutineList: routineList,
    );
  }
}

class RecommandRoutineListModel extends BaseModel {
  final List<Routine> recommandRoutineList;

  RecommandRoutineListModel({
    required int code,
    required String message,
    required this.recommandRoutineList,
  }) : super(code: code, message: message);

  factory RecommandRoutineListModel.fromJson(Map<String, dynamic> json) {
    var list = json['data']['recommandRoutineList'] as List;
    List<Routine> routineList = list.map((i) => Routine.fromJson(i)).toList();
    return RecommandRoutineListModel(
      code: json['code'],
      message: json['message'],
      recommandRoutineList: routineList,
    );
  }
}
