import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';

class BottomRoundButtonWidget extends StatelessWidget {
  final String text;
  final double w;
  Color textColor;
  Color borderColor;
  Color bgColor;

  BottomRoundButtonWidget(
    this.text, {
    this.w = double.maxFinite,
    this.textColor = Colors.white,
    this.borderColor = OmgColors.primaryColor,
    this.bgColor = OmgColors.primaryColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 40.h,
      ),
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(Size(w, 50.h)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.w),
                  side: BorderSide(color: borderColor))),
          backgroundColor: MaterialStateProperty.all<Color>(bgColor),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
