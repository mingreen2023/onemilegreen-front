import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/screens/pages/routine_detail_page.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/util/theme.dart';

class RoutineMyTitleWidget extends StatelessWidget {
  final Map<String, dynamic> title;
  const RoutineMyTitleWidget(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          minimumSize: MaterialStateProperty.all<Size>(Size.fromHeight(40.h)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.w),
            ),
          ),
        ),
        onPressed: () {
          print("id: ${title["routineId"]}");
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RoutineDetailPage(title["routineId"]),
                fullscreenDialog: true),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              title["title"],
              style: CustomTextStyle.routineMytitle,
            ),
            SizedBox(
              height: 12.h,
              width: 7.h,
              child: Image.asset(
                Images.chevronForward,
                color: primaryColor,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
