import 'package:flutter/material.dart';
import 'package:onemilegreen_front/util/theme.dart';

class RoutinListTitleWidget extends StatelessWidget {
  final title;
  const RoutinListTitleWidget(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        // popluar routine list
        Text(
          title,
          style: CustomTextStyle.routineList,
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
