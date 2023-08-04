import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/community_detail_model.dart';
import 'package:onemilegreen_front/models/community_schedule_model.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/widgets/common/back_arrow_appbar.dart';
import 'package:onemilegreen_front/widgets/common/bottom_button_sheet_widget.dart';

class CommunityScheduleDetailPage extends StatefulWidget {
  const CommunityScheduleDetailPage(
      {super.key, required this.scheduleItem, required this.comItem});
  // TODO : refactoring
  // TODO : [FIX] comId
  final ScheduleListItem scheduleItem;
  final CommunityItem comItem;

  @override
  State<CommunityScheduleDetailPage> createState() =>
      _CommunityScheduleDetailPageState();
}

class _CommunityScheduleDetailPageState
    extends State<CommunityScheduleDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackArrowAppBar(
        title: '일정 상세',
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: margin_side,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top - Community Schedule info
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      widget.comItem.comName,
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    Text(
                      "${widget.scheduleItem.schStDate} - ${widget.scheduleItem.schEndDate}",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      widget.scheduleItem.schName,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const BottomButtonSheetWidget(
              btnText: "참가 하기",
              bgColor: OmgColors.primaryColor,
            ),
          ]),
    );
  }
}
