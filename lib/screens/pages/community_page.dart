import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/community_model.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/widgets/common/tab_bar_widget.dart';
import 'package:onemilegreen_front/widgets/community/community_list_widget.dart';

class CommunityPage extends StatefulWidget {
  CommunityPage({super.key});

  final Future<CommunityListResponse> futureCommunityList =
      DioServices.getCommunityList(userNo: 1, category: "all");
  final Future<CommunityListResponse> futureMyCommunityList =
      DioServices.getMyCommunityList(userNo: 1, category: "all");

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  // TODO replace with api responce
  List<String> categoryList = [
    "전체",
    "제로웨이스트",
    "공정무역",
    "친환경",
    "비건",
    "기부",
    "ETC"
  ];

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
              bottom: BorderSide(color: OmgColors.cardColor, width: 1.w),
            ),
          ),
          child: TabBarWidget("우리구 모임", "내 모임", tabController: _tabController),
        ),
        // Row List Menu >>>
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(
              left: 19.w,
              right: 19.w,
              top: 15.h,
              bottom: 28.h,
            ),
            child: Row(
              children: categoryList
                  .expand((e) => [
                        e == "전체"
                            ? Text(
                                e,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              )
                            : Text(
                                e,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: OmgColors.secondCategoryColor,
                                ),
                              ),
                        SizedBox(width: 19.w),
                      ])
                  .toList(),
            ),
          ),
        ),
        // TabBarView >>>
        Expanded(
          child: FutureBuilder(
              future: Future.wait([
                widget.futureCommunityList,
                widget.futureMyCommunityList,
                //futureRoutineList, //category
              ]),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  CommunityListResponse res = snapshot.data![0];
                  List<CommunityList> list = res.data.communityList;

                  CommunityListResponse myRes = snapshot.data![1];
                  List<CommunityList> myList = myRes.data.communityList;

                  return TabBarView(controller: _tabController, children: [
                    CommunityListWidget(list),
                    CommunityListWidget(myList),
                  ]);
                }
                return const Center();
              }),
        ),
      ],
    );
  }
}
