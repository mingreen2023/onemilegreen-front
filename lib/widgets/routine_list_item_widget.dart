import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/util/theme.dart';

class RoutineListItemWidget extends StatelessWidget {
  final String schedule, title;
  final int point, joinCount;
  final bool isJoined;
  const RoutineListItemWidget({
    super.key,
    required this.schedule,
    required this.title,
    required this.point,
    required this.joinCount,
    required this.isJoined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            schedule,
            style: CustomTextStyle.routineItemDate,
          ),
          SizedBox(
            height: 19.h,
          ),
          Text(
            title,
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
                    "$joinCount명 참여",
                    style: CustomTextStyle.routineItemJoined,
                  ),
                  Text(
                    "$point Point",
                    style: CustomTextStyle.routineItemPoint,
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {}, icon: Image.asset(Images.routineNotJoined)),
            ],
          ),
        ],
      ),
    );
  }
}
