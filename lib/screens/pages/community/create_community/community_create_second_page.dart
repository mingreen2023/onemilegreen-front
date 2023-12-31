import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/util/theme.dart';

class CommunityCreateSecondPage extends StatelessWidget {
  const CommunityCreateSecondPage({super.key});

  Widget buildTitle(String title) => Text(
        title,
        style: CustomTextStyle.createComName,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(margin_side),
      width: double.maxFinite,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "모임 상세 정보",
          style: CustomTextStyle.createComTitle,
        ),
        SizedBox(
          height: 32.h,
        ),
        buildTitle("모임 소개글"),
        SizedBox(
          height: 18.h,
        ),
        Container(
          height: 100.h,
          constraints: BoxConstraints.expand(
            width: double.maxFinite,
            height: 100.h,
          ),
          child: TextField(
            minLines: 5,
            maxLines: null,
            decoration: InputDecoration(
              hintText: '활동 내용에 관해 입력해주세요',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Color(0xffB9B9B9),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Color(0xffB9B9B9),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: OmgColors.primaryColor,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        buildTitle("모임 대표사진 등록"),
        SizedBox(
          height: 50.h,
        ),
        IconButton(
          iconSize: 86,
          icon: Image.asset(Images.communityAdd),
          onPressed: () {
            logger.d("pressed");
          },
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return const Color(0xffB5B5B5);
                      } else {
                        return Colors.black;
                      }
                    },
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(double.maxFinite, 50.h),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "완료",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 34.h,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
