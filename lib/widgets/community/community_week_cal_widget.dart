import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/community_schedule_model.dart';
import 'package:onemilegreen_front/models/week_calendar_model.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/util/util.dart';
import 'package:onemilegreen_front/widgets/community/community_schedule_item_widget.dart';

class CommunityCalWidget extends StatefulWidget {
  final List<ScheduleListItem> scheduleList;
  final WeekCalendar weekCalendar;

  CommunityCalWidget(
    this.scheduleList, {
    super.key,
  }) : weekCalendar = Formatter.createWeekCalendar(scheduleList);

  @override
  State<CommunityCalWidget> createState() => _CommunityCalWidgetState();
}

class _CommunityCalWidgetState extends State<CommunityCalWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  late Day selDay;

  // Animated list
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  late List<ScheduleListItem> _items;
  int counter = 0;

  List<ScheduleListItem> findScheduleForSelectedDay(Day selDay) {
    List<ScheduleListItem> list = [];
    for (ScheduleListItem schedule in widget.scheduleList) {
      DateTime scheduleStart = DateTime.parse(schedule.schStDate);
      DateTime scheduleEnd = DateTime.parse(schedule.schEndDate);
      DateTime selectedDate = selDay.date;

      if (selectedDate.isAfter(scheduleStart) &&
          selectedDate.isBefore(scheduleEnd)) {
        list.add(schedule);
      }
    }

    return list;
  }

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
                            day == selDay ? Images.calSelected : day.imageAsset,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          day.date.day.toString(),
                          style: TextStyle(
                            color: day.imageAsset == Images.calNotTodo
                                ? Colors.white
                                : OmgColors.primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selDay = day;
                        updateItems(selDay);
                      });
                    }),
              ],
            ]),
      ]
    ];
  }

  Widget _buildItem(BuildContext context, int index, animation) {
    ScheduleListItem schedule = _items[index];
    return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: const Offset(0, 0),
        ).animate(animation),
        child: CommunityScheduleListItemWidget(schedule));
  }

  void updateItems(Day selDay) {
    final newItems = findScheduleForSelectedDay(selDay);

    // remove old items
    for (var i = _items.length - 1; i >= 0; i--) {
      _items.removeAt(i);
      listKey.currentState?.removeItem(
          i,
          (_, animation) =>
              Container()); // replace with your own removal animation if you want
    }

    // add new items
    for (var i = 0; i < newItems.length; i++) {
      _items.insert(i, newItems[i]);
      listKey.currentState?.insertItem(i);
    }
  }

  @override
  void initState() {
    super.initState();

    selDay = widget.weekCalendar.weeks[_current].days.firstWhere(
      (element) =>
          element.date.year == widget.weekCalendar.startDate.year &&
          element.date.month == widget.weekCalendar.startDate.month &&
          element.date.day == widget.weekCalendar.startDate.day,
      orElse: () => widget.weekCalendar.weeks[_current].days.first,
    );

    _items = findScheduleForSelectedDay(selDay);
  }

  @override
  Widget build(BuildContext context) {
    Week currentWeek = widget.weekCalendar.weeks[_current];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: OmgColors.lineGreyColor),
              bottom: BorderSide(color: OmgColors.lineGreyColor),
            ),
          ),
          padding: EdgeInsets.only(
            top: 17.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // < M월 n 주차 >
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
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
                    "${currentWeek.month}월 ${currentWeek.weekNumber}주차",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  IconButton(
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
              SizedBox(
                height: 14.h, //+ image icon top padding = 24
              ),
              // week calendar
              CarouselSlider(
                items: buildWeelCalendar(),
                carouselController: _controller,
                options: CarouselOptions(
                    height: 37.h,
                    animateToClosest: true,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              SizedBox(
                height: 24.h,
              ),
              // 해당 날짜 리스트 >>>
              AnimatedList(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                key: listKey,
                initialItemCount: _items.length,
                itemBuilder: (context, index, animation) {
                  return _buildItem(context, index, animation);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
