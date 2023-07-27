import 'package:flutter/material.dart';
import 'package:onemilegreen_front/util/theme.dart';

class RoutineSummaryWidget extends StatelessWidget {
  int inProgress;
  int completed;
  int total;

  RoutineSummaryWidget({
    required this.inProgress,
    required this.completed,
    required this.total,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              "진행 중",
              style: CustomTextStyle.routineStatusLabel,
            ),
            Text(
              "$inProgress",
              style: CustomTextStyle.routineStatus,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "완료",
              style: CustomTextStyle.routineStatusLabel,
            ),
            Text(
              "$completed",
              style: CustomTextStyle.routineStatus,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "TOTAL",
              style: CustomTextStyle.routineStatusLabel,
            ),
            Text(
              "$total",
              style: CustomTextStyle.routineStatus,
            ),
          ],
        ),
      ],
    );
  }
}
