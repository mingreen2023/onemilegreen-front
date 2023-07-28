import 'package:flutter/material.dart';
import 'package:onemilegreen_front/models/routine_status_model.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/widgets/routine_list_item_widget.dart';
import 'package:onemilegreen_front/widgets/routine_list_title_widget.dart';
import 'package:onemilegreen_front/widgets/routine_mytitle_widget.dart';
import 'package:onemilegreen_front/widgets/routine_notice_widget.dart';
import 'package:onemilegreen_front/widgets/routine_summary_widget.dart';

class RoutinePage extends StatefulWidget {
  const RoutinePage({super.key});

  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  // temp
  List<RoutineListItemWidget> widgetList = [
    const RoutineListItemWidget(
        isJoined: true,
        schedule: "월,수,금 / 2주",
        title: '하루 한끼 채식 먹기',
        joinCount: 1633,
        point: 500),
    const RoutineListItemWidget(
        isJoined: true,
        schedule: "월,수,금 / 2주",
        title: '하루 한끼 채식 먹기',
        joinCount: 1633,
        point: 500),
    const RoutineListItemWidget(
        isJoined: true,
        schedule: "월,수,금 / 2주",
        title: '하루 한끼 채식 먹기',
        joinCount: 1633,
        point: 500),
    const RoutineListItemWidget(
        isJoined: true,
        schedule: "월,수,금 / 2주",
        title: '하루 한끼 채식 먹기',
        joinCount: 1633,
        point: 500),
  ];

  // TODO : refactoring
  Future<RoutineStatusModel> futureRoutineStatus =
      DioServices.getUserRoutineStatus(userNo: "1");

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
                    future: futureRoutineStatus,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return RoutineTopWidget(snapshot.data!);
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),

                const RoutinListTitleWidget("인기 루틴 목록"),
                // popluar routine list
                // start of popular routine list >>>
                GridView.count(
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 155.w / 155.h,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: widgetList,
                ),
                // recommand routine list
                // start of recommand routine list >>>
                const RoutinListTitleWidget("추천 루틴 목록"),
                GridView.count(
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 155.w / 155.h,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: widgetList,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoutineTopWidget extends StatelessWidget {
  final RoutineStatusModel routineStatusModel;
  const RoutineTopWidget(
    this.routineStatusModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoutineNoticeWidget(routineStatusModel.todayNeighborFinishCount),
        const SizedBox(
          height: 10,
        ),
        // routine summary box
        Container(
          decoration: const BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(children: [
            SizedBox(
              height: 15.h,
            ),
            RoutineSummaryWidget(
              completed: routineStatusModel.routineFinished,
              inProgress: routineStatusModel.routineInProgress,
              total: routineStatusModel.routineTotal,
            ),
            SizedBox(
              height: 6.h,
            ),
            Column(children: <Widget>[
              for (var routineTitle
                  in routineStatusModel.currentRoutineList) ...[
                RoutineMyTitleWidget(routineTitle),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ]),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ],
    );
  }
}
