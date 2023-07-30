import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/routnine_get_userauth_model.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/util/util.dart';
import 'package:onemilegreen_front/widgets/common/back_arrow_appbar.dart';
import 'package:onemilegreen_front/widgets/common/image_loader_widget.dart';

class RoutineAllUserDetailWidget extends StatefulWidget {
  final List<RoutineDetails> routnineList;

  const RoutineAllUserDetailWidget(this.routnineList, {super.key});

  @override
  State<RoutineAllUserDetailWidget> createState() =>
      _RoutineAllUserDetailWidgetState();
}

class _RoutineAllUserDetailWidgetState
    extends State<RoutineAllUserDetailWidget> {
  late bool isLike;
  // TODO: call api
  void onClickLike(RoutineDetails item) {
    setState(() {
      logger.d("click! $isLike");

      isLike = !isLike;

      // TODO: fix with api call
      // item.urdLike = isLike ? 1 : 0;

      logger.d("click! $isLike");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackArrowAppBar(title: ''),
      body: Container(
        child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 300.w / 510.h,
            ),
            items: widget.routnineList.map(
              (item) {
                isLike = item.urdLike == 1 ? true : false;
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
                          child: ImageLoaderWidget(
                            "${Util.domain}${item.urdImage}",
                            fit: BoxFit.cover,
                            width: 300.w,
                            height: 510.h,
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
                            if (isLike) ...[
                              IconButton(
                                padding: const EdgeInsets.all(0),
                                constraints: BoxConstraints(
                                  maxHeight: 22.h,
                                  maxWidth: 20.h,
                                ),
                                iconSize: 20.w,
                                onPressed: () => onClickLike(item),
                                icon: Image.asset(
                                  Images.iconHeartFill,
                                ),
                              ),
                            ] else ...[
                              IconButton(
                                padding: const EdgeInsets.all(0),
                                constraints: BoxConstraints(
                                  maxHeight: 22.h,
                                  maxWidth: 20.h,
                                ),
                                iconSize: 20.w,
                                onPressed: () => onClickLike(item),
                                icon: Image.asset(
                                  Images.iconHeartOutlined,
                                ),
                              ),
                            ]
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
