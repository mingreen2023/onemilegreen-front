import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/routine_detail_model.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/widgets/common/primary_color_btn_widget.dart';
import 'package:onemilegreen_front/widgets/common/tab_bar_widget.dart';
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
            child: TabBarWidget(
              "인증 가이드",
              "참가자 인증 현황",
              tabController: _tabController,
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
          if (data.isJoined == 1) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryColorRoundButtonWidget(
                  "끝내기",
                  textColor: categoryGreyColor,
                  borderColor: categoryGreyColor,
                  bgColor: Colors.white,
                  w: 77.w,
                ),
                PrimaryColorRoundButtonWidget(
                  "인증하기",
                  w: 240.w,
                ),
              ],
            )
          ] else ...[
            PrimaryColorRoundButtonWidget("참가하기"),
          ]
        ],
      ),
    );
  }
}
