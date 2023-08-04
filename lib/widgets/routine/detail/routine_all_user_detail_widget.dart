import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/routnine_get_userauth_model.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/util/util.dart';
import 'package:onemilegreen_front/widgets/common/back_arrow_appbar.dart';
import 'package:onemilegreen_front/widgets/common/image_loader_widget.dart';
import 'package:collection/collection.dart';

class RoutineAllUserDetailWidget extends StatefulWidget {
  final List<RoutineDetails> routnineList;

  const RoutineAllUserDetailWidget(this.routnineList, {super.key});

  @override
  State<RoutineAllUserDetailWidget> createState() =>
      _RoutineAllUserDetailWidgetState();
}

class _RoutineAllUserDetailWidgetState
    extends State<RoutineAllUserDetailWidget> {
  late List<bool> isLike;
  double size = 0;
  bool isClicked = false;
  int mSec = 500;

  @override
  void initState() {
    super.initState();
    isLike =
        widget.routnineList.map((e) => e.urdLike == 1 ? true : false).toList();

    logger.d("isLike! $isLike");
  }

  // TODO: call api
  void onClickLike(RoutineDetails item, int index) {
    setState(() {
      isLike[index] = !isLike[index];

      if (isLike[index]) {
        isClicked = true;
        size = 100.w;

        Future.delayed(Duration(milliseconds: mSec * 2), () {
          setState(() {
            size = 0;
          });
        });

        Future.delayed(const Duration(milliseconds: 200), () {
          setState(() {
            isClicked = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackArrowAppBar(title: ''),
      body: Container(
        child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 300.w / 520.h,
            ),
            items: widget.routnineList.mapIndexed(
              (index, item) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      iconSize: 16.w,
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all<Size>(Size(16.w, 4.h)),
                      ),
                      onPressed: () {},
                      icon: Image.asset(
                        Images.iconDots,
                        width: 16.w,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ImageLoaderWidget(
                                "${Util.domain}${item.urdImage}",
                                fit: BoxFit.cover,
                                width: 300.w,
                                height: 510.h,
                              ),
                              AnimatedContainer(
                                width: 300.w,
                                height: 510.h,
                                duration: const Duration(milliseconds: 200),
                                color: isClicked
                                    ? Colors.greenAccent.withOpacity(0.1)
                                    : Colors.transparent,
                              ),
                              AnimatedSize(
                                curve: Curves.bounceOut,
                                duration: Duration(milliseconds: mSec),
                                child: SizedBox(
                                  width: size,
                                  height: size,
                                  child: Image.asset(Images.iconHeartFill),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 15.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.userNick,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            IconButton(
                              padding: const EdgeInsets.all(0),
                              constraints: BoxConstraints(
                                maxHeight: 22.h,
                                maxWidth: 20.h,
                              ),
                              iconSize: 20.w,
                              onPressed: () => onClickLike(item, index),
                              icon: Image.asset(
                                isLike[index]
                                    ? Images.iconHeartFill
                                    : Images.iconHeartOutlined,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ).toList()),
      ),
    );
  }
}
