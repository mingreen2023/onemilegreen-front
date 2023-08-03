import 'package:flutter/material.dart';
import 'package:onemilegreen_front/models/community_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/widgets/community/community_item_widget.dart';

class CommunityListWidget extends StatelessWidget {
  final List<CommunityListItem> list;
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
                  child: CommunityItemWidget(item),
                ))
            .toList(),
      ),
    );
  }
}
