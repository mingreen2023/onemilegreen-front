import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/routine_base_model.dart';
import 'package:onemilegreen_front/models/routine_join_result.dart';
import 'package:onemilegreen_front/screens/pages/routine_detail_page.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/util/theme.dart';

class RoutineListItemWidget extends StatefulWidget {
  final RoutineModel routine;
  bool originalJoin;

  RoutineListItemWidget({
    super.key,
    required this.routine,
  }) : originalJoin = routine.isJoined == 1 ? true : false;

  @override
  State<RoutineListItemWidget> createState() => _RoutineListItemWidgetState();
}

class _RoutineListItemWidgetState extends State<RoutineListItemWidget> {
  // TODO : refactoring
  Future<RoutineJoinResultModel> futureRoutineJoin =
      DioServices.insertRoutine(userNo: "1", rouId: 3);

  void onPressed() {
    setState(() {
      if (widget.originalJoin) {
        futureRoutineJoin.then(
          (value) {
            print(value.message);
            widget.originalJoin = !widget.originalJoin;
          },
        );
      } else {
        widget.originalJoin = !widget.originalJoin;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RoutineDetailPage(widget.routine.rouId),
              fullscreenDialog: true),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: checkBefore,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              widget.routine.rouDayofweek,
              style: CustomTextStyle.routineItemDate,
            ),
            SizedBox(
              height: 19.h,
            ),
            Text(
              widget.routine.rouName,
              style: CustomTextStyle.routineItemTitle,
            ),
            const SizedBox(
              height: 34,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.routine.rouUserCount} 참여",
                      style: CustomTextStyle.routineItemJoined,
                    ),
                    Text(
                      "${widget.routine.rouMileage} Point",
                      style: CustomTextStyle.routineItemPoint,
                    ),
                  ],
                ),
                if (widget.originalJoin) ...[
                  IconButton(
                      onPressed: onPressed,
                      icon: Image.asset(Images.routineJoined)),
                ] else ...[
                  IconButton(
                      onPressed: onPressed,
                      icon: Image.asset(Images.routineNotJoined)),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
