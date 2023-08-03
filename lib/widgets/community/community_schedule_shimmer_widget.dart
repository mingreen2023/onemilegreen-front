import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/images.dart';

class CommunityScheduleShimmerWidget extends StatelessWidget {
  const CommunityScheduleShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35.h,
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: OmgColors.lineGreyColor),
              bottom: BorderSide(color: OmgColors.lineGreyColor),
            ),
          ),
          padding: EdgeInsets.only(
            top: 17.h, //+ image icon top padding = 27
            bottom: 24.h,
          ),
          child: Column(children: [
            // < M월 n 주차 >
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  color: OmgColors.arrowGreyColor,
                  const AssetImage(
                    Images.chevronBack,
                  ),
                  size: 16.h,
                ),
                SizedBox(
                  width: 14.w,
                ),
                Text(
                  "  월   주차",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 14.w,
                ),
                ImageIcon(
                  color: OmgColors.arrowGreyColor,
                  const AssetImage(
                    Images.chevronForward,
                  ),
                  size: 16.h,
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                for (var i = 0; i < 7; i++) ...[
                  SizedBox(
                    width: 37.w,
                    height: 37.h,
                    child: Image.asset(Images.calSuccess),
                  ),
                ],
              ],
            ),
          ]),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "모임 일정 모두 보기",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        for (var i = 0; i < 3; i++) ...[
          Container(
            height: 40.h,
            margin: EdgeInsets.only(
              bottom: 5.h,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              color: OmgColors.cardColor,
            ),
          ),
        ],
      ],
    );
  }
}
