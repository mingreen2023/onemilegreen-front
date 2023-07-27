import 'package:flutter/material.dart';
import 'package:onemilegreen_front/util/images.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 포인트
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$nickName님,"),
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
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
