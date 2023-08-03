import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/routine_base_model.dart';
import 'package:onemilegreen_front/screens/pages/routine/routine_detail_page.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/util/theme.dart';

class RoutineListItemWidget extends StatefulWidget {
  final RoutineModel routine;
  bool originalJoin;
  Function(RoutineModel routine, bool isJoined) onPressed;

  RoutineListItemWidget({
    super.key,
    required this.routine,
    required this.onPressed,
  }) : originalJoin = routine.isJoined == 1 ? true : false;

  @override
  State<RoutineListItemWidget> createState() => _RoutineListItemWidgetState();
}

class _RoutineListItemWidgetState extends State<RoutineListItemWidget> {
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
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: OmgColors.checkBefore,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
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
            SizedBox(
              height: 34.h,
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
                    iconSize: 30.w,
                    onPressed: () =>
                        widget.onPressed(widget.routine, widget.originalJoin),
                    padding: EdgeInsets.only(right: 7.w),
                    icon: Center(
                      child: Image.asset(
                        Images.routineJoined,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ] else ...[
                  IconButton(
                    iconSize: 30.w,
                    onPressed: () =>
                        widget.onPressed(widget.routine, widget.originalJoin),
                    padding: EdgeInsets.only(right: 7.w),
                    icon: Center(
                      child: Image.asset(
                        Images.routineNotJoined,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ]
              ],
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: SizedBox(
                height: 20.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
