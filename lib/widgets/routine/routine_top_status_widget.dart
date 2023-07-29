import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/routine_status_model.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/widgets/routine/routine_mytitle_widget.dart';
import 'package:onemilegreen_front/widgets/routine/routine_notice_widget.dart';
import 'package:onemilegreen_front/widgets/routine/routine_summary_widget.dart';

class RoutineTopWidget extends StatelessWidget {
  final RoutineStatusModel routineStatusModel;

  const RoutineTopWidget(
    this.routineStatusModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoutineNoticeWidget(routineStatusModel.todayNeighborFinishCount),
        const SizedBox(
          height: 10,
        ),
        // routine summary box
        Container(
          decoration: const BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(children: [
            SizedBox(
              height: 15.h,
            ),
            RoutineSummaryWidget(
              completed: routineStatusModel.routineFinished,
              inProgress: routineStatusModel.routineInProgress,
              total: routineStatusModel.routineTotal,
            ),
            SizedBox(
              height: 13.h,
            ),
            Column(children: <Widget>[
              for (var routineTitle
                  in routineStatusModel.currentRoutineList) ...[
                RoutineMyTitleWidget(routineTitle),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ]),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ],
    );
  }
}
