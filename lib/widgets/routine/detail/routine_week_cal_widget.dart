import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/routine_detail_model.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/images.dart';

class RoutineCalWidget extends StatefulWidget {
  final RoutineDetailModel routineDetailModel;

  const RoutineCalWidget(
    this.routineDetailModel, {
    super.key,
  });

  @override
  State<RoutineCalWidget> createState() => _RoutineCalWidgetState();
}

class _RoutineCalWidgetState extends State<RoutineCalWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<Widget> list = [
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
      for (var i = 0; i < 7; i++) ...[
        SizedBox(
          width: 37.w,
          height: 37.h,
          child: Stack(
            children: <Widget>[
              Image.asset(Images.calSuccess),
              const Center(
                child: Text(
                  '27',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ]),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
      for (var i = 0; i < 7; i++) ...[
        SizedBox(
          width: 37.w,
          height: 37.h,
          child: Stack(
            children: <Widget>[
              Image.asset(Images.calSuccess),
              const Center(
                child: Text(
                  '27',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: lineGreyColor),
            ),
          ),
          padding: EdgeInsets.only(
            top: 27.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const ImageIcon(
                  color: arrowGreyColor,
                  AssetImage(
                    Images.chevronBack,
                  ),
                ),
                iconSize: 11.h,
                onPressed: () {
                  _controller.previousPage();
                },
              ),
              SizedBox(
                width: 24.w,
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
                width: 24.w,
              ),
              IconButton(
                icon: const ImageIcon(
                  color: arrowGreyColor,
                  AssetImage(
                    Images.chevronForward,
                  ),
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
          height: 24.h,
        ),
        CarouselSlider(
          items: list,
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
      ],
    );
  }
}
