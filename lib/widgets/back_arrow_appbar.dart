import 'package:flutter/material.dart';

class BackArrowAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String leadingImageAsset;
  final Function onPressedLeadingIcon;

  const BackArrowAppBar({
    super.key,
    required this.title,
    required this.leadingImageAsset,
    required this.onPressedLeadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16, // replace with your scaled size
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: IconButton(
        padding:
            const EdgeInsets.only(left: 14), // replace with your scaled size
        icon: SizedBox(
          width: 16, // replace with your scaled size
          height: 16, // replace with your scaled size
          child: Image.asset(leadingImageAsset),
        ),
        onPressed: () => onPressedLeadingIcon(),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // default AppBar height
}
