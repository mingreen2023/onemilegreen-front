import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/images.dart';

class BackArrowAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String icon;
  final Function()? onPressed;

  const BackArrowAppBar({
    super.key,
    required this.title,
    this.icon = Images.arrowBack,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp, // replace with your scaled size
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: IconButton(
          padding: EdgeInsets.only(left: 14.w), // replace with your scaled size
          icon: SizedBox(
            width: 16.w,
            height: 16.w,
            child: Image.asset(
              icon,
              color: Colors.black,
            ),
          ),
          onPressed: onPressed ?? () => Navigator.pop(context)),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // default AppBar height
}
