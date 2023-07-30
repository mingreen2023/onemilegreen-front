import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/util/images.dart';

class RoutineDetailShimmerWidget extends StatefulWidget {
  const RoutineDetailShimmerWidget({
    super.key,
  });

  @override
  State<RoutineDetailShimmerWidget> createState() =>
      _RoutineDetailShimmerWidgetState();
}

class _RoutineDetailShimmerWidgetState
    extends State<RoutineDetailShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Top - Routine info
      const Text("평일 / 1주"),
      SizedBox(
        height: 16.h,
      ),
      const Text("루틴 이름"),
      SizedBox(
        height: 23.h,
      ),
      const Text("    부터    까지"),
      SizedBox(
        height: 14.h,
      ),
      const Text("00명 참여중"),
      SizedBox(
        height: 20.h,
      ),
      Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: OmgColors.lineGreyColor),
          ),
        ),
        padding: EdgeInsets.only(
          top: 17.h, //+ image icon top padding = 27
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              padding: const EdgeInsets.all(0),
              icon: ImageIcon(
                color: OmgColors.arrowGreyColor,
                const AssetImage(
                  Images.chevronBack,
                ),
                size: 16.h,
              ),
              iconSize: 11.h,
              onPressed: () {},
            ),
            SizedBox(
              width: 14.w,
            ),
            Text(
              "루틴 1주차",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 14.w,
            ),
            IconButton(
              padding: const EdgeInsets.all(0),
              icon: ImageIcon(
                color: OmgColors.arrowGreyColor,
                const AssetImage(
                  Images.chevronForward,
                ),
                size: 16.h,
              ),
              iconSize: 11.h,
              onPressed: () {},
            ),
          ],
        ),
      ),
      SizedBox(
        height: 14.h, //+ image icon top padding = 24
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        for (var i = 0; i < 7; i++) ...[
          SizedBox(
            width: 37.w,
            height: 37.h,
            child: Image.asset(Images.calSuccess),
          ),
        ],
      ]),

      // TabView >>>
      Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: OmgColors.cardColor, width: 1.w),
            ),
          ),
          child: Row(
            children: [
              Container(
                height: tabBarHeight,
                padding: EdgeInsets.only(bottom: 10.h),
                alignment: Alignment.bottomCenter,
                child: Text(
                  "인증 가이드",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: tabBarHeight,
                padding: EdgeInsets.only(bottom: 10.h),
                alignment: Alignment.bottomCenter,
                child: Text(
                  "참가자 인증 현황",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          )),
      // TabBarView >>>
      SizedBox(
        height: 26.h,
      ),
      Text(
        "인증 사진 가이드",
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
        "포인트를 받기 위해 다음의 가이드를 지켜주세요",
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: OmgColors.titleGreyColor,
        ),
      ),
      SizedBox(
        height: 11.h,
      ),
      // 인증 예시 이미지
      Row(
        children: [
          Container(
            width: 154.w,
            height: 154.w,
            decoration: BoxDecoration(
              color: OmgColors.cardColor,
              border: Border.all(color: OmgColors.cardColor),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Container(
            width: 154.w,
            height: 154.w,
            decoration: BoxDecoration(
              color: OmgColors.cardColor,
              border: Border.all(color: OmgColors.cardColor),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 40.h,
      ),
      Container(
        width: double.maxFinite,
        height: 50.h,
        decoration: BoxDecoration(
          color: OmgColors.cardColor,
          borderRadius: BorderRadius.circular(10.w),
        ),
        margin: EdgeInsets.only(
          bottom: 40.h,
        ),
      ),
    ]);
  }
}
