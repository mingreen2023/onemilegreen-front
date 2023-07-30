import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/constants.dart';

class TabBarWidget extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  final TabController tabController;
  const TabBarWidget(
    this.firstLabel,
    this.secondLabel, {
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Container(
          height: tabBarHeight,
          padding: EdgeInsets.only(bottom: 10.h),
          alignment: Alignment.bottomCenter,
          child: Text(
            firstLabel,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          height: tabBarHeight,
          padding: EdgeInsets.only(bottom: 10.h),
          alignment: Alignment.bottomCenter,
          child: Text(
            secondLabel,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
      indicatorWeight: 1.5,
      indicatorColor: primaryColor,
      labelColor: Colors.black,
      unselectedLabelColor: lightGreyColor,
      controller: tabController,
    );
  }
}
