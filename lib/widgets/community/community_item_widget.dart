import 'package:flutter/material.dart';
import 'package:onemilegreen_front/models/community_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/screens/pages/community/community_detail_page.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/util.dart';
import 'package:onemilegreen_front/widgets/common/image_loader_widget.dart';

class CommunityItemWidget extends StatelessWidget {
  CommunityListItem item;
  CommunityItemWidget(
    this.item, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CommunityDetailPage(item.comId),
              fullscreenDialog: true),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageLoaderWidget(
                "${Util.domain}${item.comImage}",
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                item.comCategory,
                style: TextStyle(
                  color: OmgColors.categoryGreyColor,
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
              color: OmgColors.countGreyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
