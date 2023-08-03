import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/community_detail_model.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/util/images.dart';

class BottomButtonSheetWidget extends StatelessWidget {
  final String btnText;
  final Color bgColor;
  final Color textColor;
  final CommunityItem? item;
  final void Function(CommunityItem item)? onPressed;

  const BottomButtonSheetWidget({
    super.key,
    this.btnText = "일정 보기",
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
    this.item,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: margin_side, vertical: 10.h),
      height: 94.h,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300, width: 1.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // member count
              const MemberCounterWidget(),
              Container(width: 8.0),
              const CircleIconButtonWidget(),
            ],
          ),
          // 일정 보기 >>>
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                bgColor,
              ),
              foregroundColor: MaterialStateProperty.all<Color>(
                textColor,
              ),
              fixedSize: MaterialStateProperty.all<Size>(
                Size(130.w, 43.h),
              ),
            ),
            onPressed: () => onPressed?.call(item!),
            child: Text(
              btnText,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircleIconButtonWidget extends StatelessWidget {
  const CircleIconButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Button pressed!');
      },
      child: Container(
        width: 35.w,
        height: 35.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: OmgColors.lineGreyColor,
          ),
        ),
        child: Center(
          child: Image.asset(
            width: 15.w,
            height: 15.w,
            Images.communityShare,
          ),
        ),
      ),
    );
  }
}

class MemberCounterWidget extends StatelessWidget {
  const MemberCounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: OmgColors.primaryColor,
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            Images.communityPersonW, // replace with your image asset path
            width: 14.0,
            height: 14.0,
          ),
          const SizedBox(width: 8.0), // adjust for your spacing preference
          Text(
            "30",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "/50",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}
