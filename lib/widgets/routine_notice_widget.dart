import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';

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
        child: Text(
          "오늘은 $joinCount명의 이웃이 루틴을 수행했어요!",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
