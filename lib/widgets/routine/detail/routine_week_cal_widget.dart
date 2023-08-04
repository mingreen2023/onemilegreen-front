import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/routine_detail_model.dart';
import 'package:onemilegreen_front/models/week_calendar_model.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/util/util.dart';

class RoutineCalWidget extends StatefulWidget {
  final RoutineDetailModel routineDetailModel;
  final WeekCalendar weekCalendar;

  RoutineCalWidget(
    this.routineDetailModel, {
    super.key,
  }) : weekCalendar = Formatter.createRoutineWeekCalendar(routineDetailModel);

  @override
  State<RoutineCalWidget> createState() => _RoutineCalWidgetState();
}

class _RoutineCalWidgetState extends State<RoutineCalWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<Row> buildWeelCalendar() {
    return [
      for (Week week in widget.weekCalendar.weeks) ...[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              for (Day day in week.days) ...[
                InkWell(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 37.w,
                      height: 37.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            day.imageAsset,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          day.date.day.toString(),
                          style: TextStyle(
                            color: (day.imageAsset == Images.calFailed)
                                ? Colors.transparent
                                : (day.imageAsset == Images.calNotTodo)
                                    ? Colors.white
                                    : OmgColors.primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {});
                    }),
              ],
            ]),
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<Row> routineCalendar = buildWeelCalendar();

    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: OmgColors.lineGreyColor),
            ),
          ),
          padding: EdgeInsets.only(
            top: 17.h, //+ image icon top padding = 27
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              routineCalendar.length == 1
                  ? SizedBox(
                      width: 48.w,
                      height: 48.w,
                    )
                  : IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: ImageIcon(
                        color: OmgColors.arrowGreyColor,
                        const AssetImage(
                          Images.chevronBack,
                        ),
                        size: 16.h,
                      ),
                      iconSize: 11.h,
                      onPressed: () {
                        _controller.previousPage();
                      },
                    ),
              SizedBox(
                width: 14.w,
              ),
              Text(
                "루틴 ${_current + 1}주차",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 14.w,
              ),
              routineCalendar.length == 1
                  ? SizedBox(
                      width: 48.w,
                      height: 48.w,
                    )
                  : IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: ImageIcon(
                        color: OmgColors.arrowGreyColor,
                        const AssetImage(
                          Images.chevronForward,
                        ),
                        size: 16.h,
                      ),
                      iconSize: 11.h,
                      onPressed: () {
                        _controller.nextPage();
                      },
                    ),
            ],
          ),
        ),
        SizedBox(
          height: 14.h, //+ image icon top padding = 24
        ),
        CarouselSlider(
          items: routineCalendar,
          carouselController: _controller,
          options: CarouselOptions(
              height: 37.h,
              enableInfiniteScroll: false,
              animateToClosest: true,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ],
    );
  }
}
