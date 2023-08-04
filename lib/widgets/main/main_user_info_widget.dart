import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/widgets/common/webview_widget.dart';
import 'package:share_plus/share_plus.dart';

class UserInfoWidget extends StatelessWidget {
  final String nickName, userMileage;
  const UserInfoWidget({
    super.key,
    required this.nickName,
    required this.userMileage,
  });

  void onPressed() async {
    File f = await Images.getImageFileFromAssets(Images.shareImage);
    logger.d("onPressed");

    Share.shareXFiles([XFile(f.path)]);
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    userMileage,
                    textAlign: TextAlign.end,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 5.h,
                    ),
                    child: const Text(
                      " M",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
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
                  onPressed: onPressed,
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
