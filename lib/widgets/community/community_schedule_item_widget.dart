import 'package:onemilegreen_front/models/community_schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/util.dart';

class CommunityScheduleListItemWidget extends StatelessWidget {
  final ScheduleListItem item;
  const CommunityScheduleListItemWidget(
    this.item, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: 40.h,
        margin: EdgeInsets.only(
          bottom: 5.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 18.w,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          color: OmgColors.cardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //08.08 12:00
            Text(
              Formatter.formatDateTime(item.schStDate),
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: OmgColors.primaryColor,
              ),
            ),
            SizedBox(width: 14.w),
            Text(
              item.schName,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w300,
                color: OmgColors.primaryColor,
              ),
            ),
            Expanded(
              child: Text(
                "${item.joinpeople}/${item.schMaxMem}",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: OmgColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
