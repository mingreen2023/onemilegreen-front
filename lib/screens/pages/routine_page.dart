import 'package:flutter/material.dart';
import 'package:onemilegreen_front/models/routine_list_model.dart';
import 'package:onemilegreen_front/models/routine_status_model.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/widgets/routine/routine_list_item_widget.dart';
import 'package:onemilegreen_front/widgets/routine/routine_list_title_widget.dart';
import 'package:onemilegreen_front/widgets/routine/routine_shimmer_widget.dart';
import 'package:onemilegreen_front/widgets/routine/routine_top_status_widget.dart';
import 'package:shimmer/shimmer.dart';

class RoutinePage extends StatefulWidget {
  RoutinePage({super.key});
  // TODO : refactoring
  Future<RoutineStatusModel> futureRoutineStatus =
      DioServices.getUserRoutineStatus(userNo: "1");

  Future<RoutineListModel> futureRoutineList =
      DioServices.getRoutineList(userNo: "1");

  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  // TODO: manage user info
  String userName = "서하";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Top - my routine status
          Padding(
            padding: EdgeInsets.symmetric(horizontal: margin_side),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: margin_top,
                ),
                FutureBuilder(
                  future: Future.wait([
                    widget.futureRoutineStatus,
                    widget.futureRoutineList,
                  ]),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      RoutineStatusModel status =
                          snapshot.data![0] as RoutineStatusModel;
                      RoutineListModel list =
                          snapshot.data![1] as RoutineListModel;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RoutineTopWidget(status),
                          // popluar routine list
                          // start of popular routine list >>>
                          const RoutinListTitleWidget("인기 루틴 목록"),
                          GridView.count(
                            physics: const ScrollPhysics(),
                            padding: const EdgeInsets.all(0),
                            mainAxisSpacing: 1.w,
                            crossAxisSpacing: 10.w,
                            childAspectRatio: 156.w / 169.h,
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            children: list.popularRoutineList
                                .map((e) => RoutineListItemWidget(routine: e))
                                .toList(),
                          ),
                          // recommand routine list
                          // start of recommand routine list >>>
                          const RoutinListTitleWidget("추천 루틴 목록"),
                          GridView.count(
                            physics: const ScrollPhysics(),
                            padding: const EdgeInsets.all(0),
                            mainAxisSpacing: 1.0,
                            crossAxisSpacing: 10.w,
                            childAspectRatio: 155.w / 169.h,
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            children: list.recommandRoutineList
                                .map((e) => RoutineListItemWidget(routine: e))
                                .toList(),
                          ),
                        ],
                      );
                    }
                    return Shimmer.fromColors(
                      baseColor: cardColor,
                      highlightColor: Colors.white,
                      child: const RoutineShimmerPage(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
