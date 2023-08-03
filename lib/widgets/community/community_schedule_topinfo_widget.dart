import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/community_detail_model.dart';

class CommunityScheduleTopInfoWidget extends StatelessWidget {
  final CommunityItem comItem;
  const CommunityScheduleTopInfoWidget({
    super.key,
    required this.comItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16.h,
        ),
        Text(
          comItem.comName,
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
          "서울특별시, ${comItem.comDistrict}",
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
          "${comItem.comNumPeople}명 참여중",
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
