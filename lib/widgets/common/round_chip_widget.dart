import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';

class RoundChipWidget extends StatelessWidget {
  final String text;
  final double w;
  double? h;
  double? radius;
  Color textColor;
  Color borderColor;
  Color bgColor;

  RoundChipWidget(
    this.text, {
    this.w = double.maxFinite,
    this.h,
    this.radius,
    this.textColor = Colors.white,
    this.borderColor = OmgColors.primaryColor,
    this.bgColor = OmgColors.primaryColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5.3.h,
        horizontal: 8.w,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 20.w)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
