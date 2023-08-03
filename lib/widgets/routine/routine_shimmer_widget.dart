import 'package:flutter/material.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/widgets/routine/routine_list_title_widget.dart';
import 'package:onemilegreen_front/widgets/routine/routine_mytitle_widget.dart';
import 'package:onemilegreen_front/widgets/routine/routine_notice_widget.dart';
import 'package:onemilegreen_front/widgets/routine/routine_summary_widget.dart';

class RoutineShimmerPage extends StatelessWidget {
  const RoutineShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top - my routine status
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(children: [
              const RoutineNoticeWidget(0),
              const SizedBox(
                height: 10,
              ),
              // routine summary box
              Container(
                decoration: const BoxDecoration(
                  color: OmgColors.cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  RoutineSummaryWidget(
                    completed: 0,
                    inProgress: 0,
                    total: 0,
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Column(children: <Widget>[
                    const RoutineMyTitleWidget({
                      'title': 'title',
                    }),
                    SizedBox(
                      height: 5.h,
                    ),
                    const RoutineMyTitleWidget({
                      'title': 'title',
                    }),
                    SizedBox(
                      height: 5.h,
                    ),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ]),
            // popluar routine list
            // start of popular routine list >>>
            const RoutinListTitleWidget("인기 루틴 목록"),
          ],
        ),
      ],
    );
  }
}
