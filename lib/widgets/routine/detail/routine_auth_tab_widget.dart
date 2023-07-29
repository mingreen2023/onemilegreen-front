import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/images.dart';

class RoutineAuthTabWidget extends StatelessWidget {
  const RoutineAuthTabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
            color: titleGreyColor,
          ),
        ),
        SizedBox(
          height: 11.h,
        ),
        // 인증 예시 이미지
        Row(
          children: [
            Stack(
              children: [
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: SizedBox(
                    width: 30.w,
                    height: 30.h,
                    child: Image.asset(Images.iconX),
                  ),
                ),
                Container(
                  width: 154.w,
                  height: 154.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: cardColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 12.w,
            ),
            Stack(children: [
              Positioned(
                bottom: 10,
                right: 10,
                child: SizedBox(
                  width: 30.w,
                  height: 30.h,
                  child: Image.asset(Images.iconO),
                ),
              ),
              Container(
                width: 154.w,
                height: 154.h,
                decoration: BoxDecoration(
                  border: Border.all(color: cardColor),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ]),
          ],
        ),
        SizedBox(
          height: 13.h,
        ),
        Container(
          width: double.maxFinite,
          height: 71.h,
          color: textGreyColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "· 투명 음료를 다는 페트병인가요? (양념류 통 불가)\n· 투명 플라스틱 겉면에 이물질이 없나요?\n· 내용물이 비었나요?",
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w300,
                color: mainSecondTextColor,
                height: 1.5,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 70.h,
        ),
      ],
    );
  }
}
