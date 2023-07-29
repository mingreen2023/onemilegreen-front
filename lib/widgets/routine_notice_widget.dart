import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/theme.dart';

class RoutineNoticeWidget extends StatelessWidget {
  final int joinCount;

  const RoutineNoticeWidget(
    this.joinCount, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: "오늘은 ",
            style: CustomTextStyle.routineNeigbor,
            children: <TextSpan>[
              TextSpan(
                text: "$joinCount명의 이웃",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: "이 루틴을 수행했어요!"),
            ],
          ),
        ),
      ),
    );
  }
}
