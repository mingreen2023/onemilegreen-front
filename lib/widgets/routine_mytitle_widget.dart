import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/util/theme.dart';

class RoutineMyTitleWidget extends StatelessWidget {
  final title;
  const RoutineMyTitleWidget(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Container(
        height: 40.sp,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: EdgeInsets.only(left: 15.h),
            child: Text(
              title,
              style: CustomTextStyle.routineMytitle,
            ),
          ),
          SizedBox(
            height: 25.h,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(Images.chevronForward),
            ),
          ),
        ]),
      ),
    );
  }
}
