import 'package:flutter/material.dart';
import 'package:onemilegreen_front/models/community_detail_model.dart';
import 'package:onemilegreen_front/models/community_schedule_model.dart';
import 'package:onemilegreen_front/screens/pages/community/schedule/community_schedule_detail_page.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/util.dart';
import 'package:onemilegreen_front/widgets/common/back_arrow_appbar.dart';
import 'package:onemilegreen_front/widgets/community/community_schedule_item_widget.dart';
import 'package:onemilegreen_front/widgets/community/community_schedule_shimmer_widget.dart';
import 'package:onemilegreen_front/widgets/community/community_schedule_topinfo_widget.dart';
import 'package:onemilegreen_front/widgets/community/community_week_cal_widget.dart';

class CommunitySchedulePage extends StatefulWidget {
  final CommunityItem comItem;

  const CommunitySchedulePage({
    super.key,
    required this.comItem,
  });

  @override
  State<CommunitySchedulePage> createState() => _CommunitySchedulePageState();
}

class _CommunitySchedulePageState extends State<CommunitySchedulePage>
    with TickerProviderStateMixin {
  // TODO : refactoring
  Future<ScheduleData> futureScheduleData =
      DioServices.getCommunityAllSchedule(comId: 3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackArrowAppBar(
        title: '일정 보기',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top - Community Schedule info
            CommunityScheduleTopInfoWidget(
              comItem: widget.comItem,
            ),
            Expanded(
              child: FutureBuilder(
                  future: futureScheduleData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ScheduleListItem> schedule =
                          snapshot.data!.scheduleLists;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommunityCalWidget(schedule),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 20.h,
                            ),
                            child: Text(
                              "모임 일정 모두 보기",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              children: schedule
                                  .map(
                                    (item) => InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CommunityScheduleDetailPage(
                                                    scheduleItem: item,
                                                    comItem: widget.comItem,
                                                  ),
                                              fullscreenDialog: true),
                                        );
                                      },
                                      child:
                                          CommunityScheduleListItemWidget(item),
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                        ],
                      );
                    }
                    return Util.ShimmerBuilder(
                        const CommunityScheduleShimmerWidget());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
