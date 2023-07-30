import 'package:flutter/material.dart';
import 'package:onemilegreen_front/models/routine_single_model.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/util/util.dart';
import 'package:onemilegreen_front/widgets/common/back_arrow_appbar.dart';
import 'package:onemilegreen_front/widgets/routine/detail/routine_detail_tabview_widget.dart';
import 'package:onemilegreen_front/widgets/routine/detail/routine_detail_topinfo_widget.dart';
import 'package:onemilegreen_front/widgets/routine/detail/routine_shimmer_widget.dart';
import 'package:onemilegreen_front/widgets/routine/detail/routine_week_cal_widget.dart';

class RoutineDetailPage extends StatefulWidget {
  final int rouId;
  const RoutineDetailPage(
    this.rouId, {
    super.key,
  });

  @override
  State<RoutineDetailPage> createState() => _RoutineDetailPageState();
}

class _RoutineDetailPageState extends State<RoutineDetailPage>
    with TickerProviderStateMixin {
  // TODO : refactoring
  Future<SingleRoutineModel> futureRoutineItem =
      DioServices.getRoutineItem(userNo: "1", rouId: 3);

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
    return Scaffold(
      appBar: const BackArrowAppBar(
        title: '루틴 상세',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: FutureBuilder(
            future: futureRoutineItem,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top - Routine info
                    RoutineDetailTopInfoWidget(
                      snapshot.data!.data,
                      key: Key('infoWidget${snapshot.data!.data.rouId}'),
                    ),

                    RoutineCalWidget(
                      snapshot.data!.data,
                      key: Key('calWidget${snapshot.data!.data.rouId}'),
                    ),

                    // TabView >>>
                    RoutineDetailTabViewWidget(
                      tabBarHeight: tabBarHeight,
                      tabController: _tabController,
                      data: snapshot.data!.data,
                    ),
                  ],
                );
              }
              return Util.ShimmerBuilder(const RoutineDetailShimmerWidget());
            }),
      ),
    );
  }
}
