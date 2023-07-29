import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/theme.dart';

class RoutinListTitleWidget extends StatelessWidget {
  final title;
  const RoutinListTitleWidget(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 25.h,
        ),
        // popluar routine list
        Text(
          title,
          style: CustomTextStyle.routineList,
        ),
        SizedBox(
          height: 25.h,
        ),
      ],
    );
  }
}
