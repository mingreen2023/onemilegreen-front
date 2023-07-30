import 'package:flutter/material.dart';
import 'package:onemilegreen_front/models/community_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/widgets/common/image_loader_widget.dart';

class CommunityListWidget extends StatelessWidget {
  final List<CommunityList> list;
  const CommunityListWidget(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: margin_side),
      child: GridView.count(
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.all(0),
        mainAxisSpacing: 1.w,
        crossAxisSpacing: 10.w,
        childAspectRatio: 156.w / 310.h,
        shrinkWrap: true,
        crossAxisCount: 2,
        children: list
            .map((item) => Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageLoaderWidget(
                            item.comImage,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            item.comCategory,
                            style: TextStyle(
                              color: categoryGreyColor,
                              fontSize: 11.sp,
                            ),
                          ),
                          Text(
                            item.comName,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            item.comContent,
                            style: TextStyle(
                              fontSize: 16.sp,
                              height: 0.9.h,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                        ],
                      ),
                      Text(
                        "${item.comNumPeople}",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: countGreyColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
