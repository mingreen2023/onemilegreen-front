import 'package:onemilegreen_front/models/base_model.dart';

class RoutineStatusModel extends BaseModel {
  final int todayNeighborFinishCount;
  final int routineInProgress;
  final int routineFinished;
  final int routineTotal;
  final List<String> currentRoutineList;

  RoutineStatusModel({
    required int code,
    required String message,
    required this.todayNeighborFinishCount,
    required this.routineInProgress,
    required this.routineFinished,
    required this.routineTotal,
    required this.currentRoutineList,
  }) : super(code: code, message: message);

  factory RoutineStatusModel.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return RoutineStatusModel(
      code: json['code'],
      message: json['message'],
      todayNeighborFinishCount: data['todayNeighborFinishCount'],
      routineInProgress: data['routineInProgress'],
      routineFinished: data['routineFinished'],
      routineTotal: data['routineTotal'],
      currentRoutineList: List<String>.from(data['currentRoutineList']),
    );
  }
}
