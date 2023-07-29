
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/routine_detail_model.dart';
import 'package:onemilegreen_front/screens/pages/routine_detail_page.dart';
import 'package:onemilegreen_front/util/colors.dart';

class RoutineDetailTopInfoWidget extends StatelessWidget {
  final RoutineDetailModel data;
  const RoutineDetailTopInfoWidget(
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${data.rouDayofweek} / ${data.rouStDate} - ${data.rouEndDate}",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: scheduleLabelColor,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          data.rouName,
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 23.h,
        ),
        Text(
          "${data.rouStDate}부터 ${data.rouEndDate}",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 14.h,
        ),
        Text(
          "${data.rouUserCount}명 참여중",
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
