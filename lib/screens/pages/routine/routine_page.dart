import 'package:flutter/material.dart';
import 'package:onemilegreen_front/models/routine_base_model.dart';
import 'package:onemilegreen_front/models/routine_join_result.dart';
import 'package:onemilegreen_front/models/routine_list_model.dart';
import 'package:onemilegreen_front/models/routine_status_model.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/widgets/routine/routine_list_item_widget.dart';
import 'package:onemilegreen_front/widgets/routine/routine_list_title_widget.dart';
import 'package:onemilegreen_front/widgets/routine/routine_mytitle_widget.dart';
import 'package:onemilegreen_front/widgets/routine/routine_notice_widget.dart';
import 'package:onemilegreen_front/widgets/routine/routine_shimmer_widget.dart';
import 'package:onemilegreen_front/widgets/routine/routine_summary_widget.dart';
import 'package:shimmer/shimmer.dart';

class RoutinePage extends StatefulWidget {
  const RoutinePage({super.key});

  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  // TODO : refactoring
  Future<RoutineStatusModel> futureRoutineStatus =
      DioServices.getUserRoutineStatus(userNo: "1");

  Future<RoutineListModel> futureRoutineList =
      DioServices.getRoutineList(userNo: "1");

  // TODO: manage user info
  String userName = "서하";

  // Animated list
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  late List<Map<String, dynamic>> _items;

  int counter = 0;

  void updateItems(Map<String, dynamic> titleItem) {
    _items.add(titleItem);
    listKey.currentState?.insertItem(_items.length - 1);
  }

  Widget _buildItem(BuildContext context, int index, animation) {
    Map<String, dynamic> titleItem = _items[index];
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      ).animate(animation),
      child: Column(
        children: [
          RoutineMyTitleWidget(titleItem),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }

  void onPressed(RoutineModel routine, bool isJoined) {
    // TODO : refactoring
    // TODO : fix routine.rouId
    Future<RoutineJoinResultModel> futureRoutineJoin =
        DioServices.insertRoutine(userNo: "1", rouId: 3);
    futureRoutineJoin.then((value) {
      setState(() {
        logger.d("routine added ${value.routineId}");
        isJoined = !isJoined;
        updateItems({"rouId": value.routineId, "title": value.routineTitle});
        // futureRoutineStatus = DioServices.getUserRoutineStatus(userNo: "1");
        // futureRoutineStatus.then(
        //   (value) {
        //     updateItems(value);
        //   },
        // );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    logger.d("rebuild");
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
                    futureRoutineStatus,
                    futureRoutineList,
                  ]),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      RoutineStatusModel status =
                          snapshot.data![0] as RoutineStatusModel;
                      RoutineListModel list =
                          snapshot.data![1] as RoutineListModel;

                      _items = status.currentRoutineList;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              RoutineNoticeWidget(
                                  status.todayNeighborFinishCount),
                              const SizedBox(
                                height: 10,
                              ),
                              // routine summary box
                              Container(
                                decoration: const BoxDecoration(
                                  color: OmgColors.cardColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(children: [
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  RoutineSummaryWidget(
                                    completed: status.routineFinished,
                                    inProgress: status.routineInProgress,
                                    total: status.routineTotal,
                                  ),
                                  SizedBox(
                                    height: 13.h,
                                  ),
                                  AnimatedList(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    key: listKey,
                                    initialItemCount: _items.length,
                                    itemBuilder: (context, index, animation) {
                                      return _buildItem(
                                          context, index, animation);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ]),
                              ),
                            ],
                          ),
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
                                .map((e) => RoutineListItemWidget(
                                      routine: e,
                                      onPressed: onPressed,
                                    ))
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
                                .map((e) => RoutineListItemWidget(
                                      routine: e,
                                      onPressed: onPressed,
                                    ))
                                .toList(),
                          ),
                        ],
                      );
                    }
                    return Shimmer.fromColors(
                      baseColor: OmgColors.cardColor,
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
