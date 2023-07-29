import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/routine_detail_model.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/images.dart';

class RoutinePeopleTabWidget extends StatelessWidget {
  final RoutineDetailModel data;

  const RoutinePeopleTabWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 26.h,
        ),
        Text(
          "참가자 인증 현황",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Text(
          "다른 참가자의 인증 현황을 확인해보세요",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            color: titleGreyColor,
          ),
        ),
        SizedBox(
          height: 24.h,
        ),

        // If joined == true,
        if (data.isJoined == 1) ...[
          const RoutineDetailJoinedStatusWidget(),
        ] else ...[
          // 루틴 참여하고 사진 바로 확인하기
          InkWell(
            onTap: () {
              print("Image tapped!");
            },
            child: Image.asset(
              Images.routineJoinToCheck, // Replace with your image path
              width: 324.w,
              height: 42.h,
              fit: BoxFit.cover,
            ),
          ),
        ]
      ],
    );
  }
}

class RoutineDetailJoinedStatusWidget extends StatelessWidget {
  const RoutineDetailJoinedStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            for (var i = 0; i < 3; i++) ...[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.h,
                ),
                child: InkWell(
                  onTap: () {
                    print("Image tapped!");
                  },
                  child: Image.asset(
                    Images.routineAuthPlaceholder,
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
            ],
          ],
        ),
        // 참가자 인증 사진 바로 확인하기
        InkWell(
          onTap: () {
            print("Image tapped!");
          },
          child: Image.asset(
            Images.routineCheck,
            width: 324.w,
            height: 42.h,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
