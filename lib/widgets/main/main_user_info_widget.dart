import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/widgets/common/webview_widget.dart';

class UserInfoWidget extends StatelessWidget {
  final String nickName, userMileage;
  const UserInfoWidget({
    super.key,
    required this.nickName,
    required this.userMileage,
  });

  @override
  Widget build(BuildContext context) {
    double iconSize = 36;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: margin_side),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 포인트
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$nickName님,",
                style: TextStyle(
                    fontSize: 18.w,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Text(
                userMileage,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
          // 아이콘
          Row(
            children: [
              SizedBox(
                width: iconSize,
                height: iconSize,
                child: IconButton(
                  icon: Image.asset(Images.mainTopArrow),
                  alignment: Alignment.topCenter,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: iconSize,
                height: iconSize,
                child: IconButton(
                  icon: Image.asset(Images.mainTopMap),
                  alignment: Alignment.topCenter,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OmgWebViewWidget(mapUrl),
                          fullscreenDialog: true),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
