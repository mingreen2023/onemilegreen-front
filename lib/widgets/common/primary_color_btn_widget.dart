import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';

class PrimaryColorRoundButtonWidget extends StatelessWidget {
  final String text;
  const PrimaryColorRoundButtonWidget(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(
        bottom: 40.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
      ),
      width: double.maxFinite,
      height: 50.h,
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
