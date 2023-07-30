import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/routine_detail_model.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/util.dart';

class RoutineDetailTopInfoWidget extends StatelessWidget {
  final RoutineDetailModel data;
  const RoutineDetailTopInfoWidget(
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    logger.d(data);
    logger.d(data.rouDayofweek);
    logger.d(data.rouStDate);
    logger.d(data.rouEndDate);
    logger.d(data.rouDetailList);
    logger.d(data.rouDetailList?[0]);
    logger.d(data.rouDetailList?[0].date);
    logger.d(data.rouDetailList?[0].status);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${data.rouDayofweek} / ${Formatter.calculateWeeks(data.rouStDate, data.rouEndDate)}주",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: OmgColors.scheduleLabelColor,
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
          "${Formatter.formatDate(data.rouStDate)}부터 ${Formatter.formatDate(data.rouEndDate)}까지",
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
