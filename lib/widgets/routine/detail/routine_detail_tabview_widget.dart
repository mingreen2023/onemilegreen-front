import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/routine_detail_model.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/widgets/common/primary_color_btn_widget.dart';
import 'package:onemilegreen_front/widgets/routine/detail/routine_auth_tab_widget.dart';
import 'package:onemilegreen_front/widgets/routine/detail/routine_people_tab_widget.dart';

class RoutineDetailTabViewWidget extends StatelessWidget {
  RoutineDetailTabViewWidget({
    super.key,
    required this.tabBarHeight,
    required TabController tabController,
    required this.data,
  }) : _tabController = tabController;
  RoutineDetailModel data;
  final double tabBarHeight;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: cardColor, width: 1.w),
              ),
            ),
            child: TabBar(
              tabs: [
                Container(
                  height: tabBarHeight,
                  padding: EdgeInsets.only(bottom: 10.h),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '인증사진 가이드',
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
                    '참가자 인증현황',
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
              unselectedLabelColor: const Color(0xFFA1A1A1),
              controller: _tabController,
            ),
          ),
          // TabBarView >>>
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                RoutineAuthTabWidget(data: data),
                RoutinePeopleTabWidget(data: data),
              ],
            ),
          ),
          const PrimaryColorRoundButtonWidget("참가하기"),
        ],
      ),
    );
  }
}
