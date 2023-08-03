import 'package:flutter/material.dart';
import 'package:onemilegreen_front/models/community_detail_model.dart';
import 'package:onemilegreen_front/screens/pages/community/community_schedule_page.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/util/util.dart';
import 'package:onemilegreen_front/widgets/common/back_arrow_appbar.dart';
import 'package:onemilegreen_front/widgets/common/bottom_button_sheet_widget.dart';
import 'package:onemilegreen_front/widgets/common/image_loader_widget.dart';
import 'package:onemilegreen_front/widgets/common/round_chip_widget.dart';
import 'package:onemilegreen_front/widgets/community/community_item_shimmer_widget.dart';

class CommunityDetailPage extends StatefulWidget {
  CommunityDetailPage(int comId, {super.key});
  // TODO : refactoring
  // TODO : [FIX] comId
  Future<CommunityItemResponse> futureCommunityDetail =
      DioServices.getCoummunityDetail(userNo: 1, com_id: 3);

  @override
  State<CommunityDetailPage> createState() => _CommunityDetailPageState();
}

class _CommunityDetailPageState extends State<CommunityDetailPage> {
  late CommunityItem item;

  void onPressShowSchedule(CommunityItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CommunitySchedulePage(
                comItem: item,
              ),
          fullscreenDialog: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackArrowAppBar(
        title: '모임 상세',
      ),
      body: FutureBuilder(
        future: widget.futureCommunityDetail,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            item = snapshot.data!.data.communityItem;
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 26.h,
                          ),
                          // main image >>>
                          ImageLoaderWidget(
                            "${Util.domain}${item.comImage}",
                            width: double.maxFinite,
                            height: 271.h,
                          ),
                          // 이 모임에서 총 ㅇㅇ톤의 탄소를 줄였어요.
                          Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                              vertical: 15.h,
                              horizontal: 20.w,
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: OmgColors.lineGreyColor,
                                ),
                              ),
                            ),
                            child: Text(
                              "이 모임에서 총 OO톤의 탄소를 줄였어요.",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          // detail info >>>
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: margin_side,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20.h),
                                RoundChipWidget(
                                  item.comCategory,
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  item.comName,
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "서울특별시 ${item.comDistrict}",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: OmgColors.districtGreyColor),
                                ),
                                SizedBox(height: 14.h),
                                Text(
                                  "${item.comTotalMileage} M",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20.h,
                                  ),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                      color: OmgColors.lineGreyColor,
                                    )),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "모임 활동 사진",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Image.asset(
                                        color: Colors.black,
                                        width: 8.w,
                                        height: 14.w,
                                        Images.chevronForward,
                                      ),
                                    ],
                                  ),
                                ),

                                // feeds >>>
                                GridView.count(
                                  physics: const ScrollPhysics(),
                                  padding: const EdgeInsets.all(0),
                                  mainAxisSpacing: 1.w,
                                  crossAxisSpacing: 1.w,
                                  childAspectRatio: 156.w / 169.h,
                                  shrinkWrap: true,
                                  crossAxisCount: 3,
                                  // TODO: [FIX] 모임 상세 - 가입 O 만 가정
                                  children: item.photoList!.map((e) {
                                    PhotoItem feed = e;
                                    return ImageLoaderWidget(
                                      "${Util.domain}${feed.feedImage}",
                                      width: 105.w,
                                      height: 105.w,
                                    );
                                  }).toList(),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BottomButtonSheetWidget(
                    item: item,
                    onPressed: onPressShowSchedule,
                  ),
                ]);
          }
          return Util.ShimmerBuilder(
            const CommunityItemShimmerWidget(),
          );
        },
      ),
    );
  }
}
