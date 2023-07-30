import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/community_model.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/widgets/common/primary_color_btn_widget.dart';

class CommunityPage extends StatefulWidget {
  CommunityPage({super.key});
  Future<CommunityListResponse> futureCommunityList =
      DioServices.getCommunityList(userNo: 1, category: "all");
  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: margin_top,
        ),
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
            children: const [
              Placeholder(),
              Placeholder(),
            ],
          ),
        ),
        const PrimaryColorRoundButtonWidget("참가하기"),
      ],
    );
  }
}
