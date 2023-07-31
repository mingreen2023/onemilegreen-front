import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/widgets/common/round_chip_widget.dart';

class CommunityItemShimmerWidget extends StatelessWidget {
  const CommunityItemShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 26.h,
          ),
          // slider >>>
          Container(
            width: double.maxFinite,
            height: 271.h,
            decoration: const BoxDecoration(
              color: OmgColors.primaryColor,
            ),
          ),
          // 이 모임에서 총 ㅇㅇ톤의 탄소를 줄였어요.
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 20.w,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: OmgColors.lineGreyColor,
                ),
              ),
            ),
            child: Text(
              "이 모임에서 총 OO톤의 탄소를 줄였어요.",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // detail info >>>
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: margin_side,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 20.h),
              RoundChipWidget(
                "000",
              ),
              SizedBox(height: 20.h),
              Text(
                "모임 이름",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "서울특별시 00구",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: OmgColors.districtGreyColor),
              ),
              SizedBox(height: 14.h),
              Text(
                "000 M",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                    color: OmgColors.lineGreyColor,
                  )),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "모임 활동 사진",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Image.asset(
                      color: Colors.black,
                      width: 8.w,
                      height: 14.w,
                      Images.chevronForward,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ]);
  }
}
