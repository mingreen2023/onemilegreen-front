import 'package:flutter/material.dart';

class GreenEffectCardWidget extends StatelessWidget {
  const GreenEffectCardWidget({
    super.key,
    required this.name,
    required this.index,
    required this.effectType,
    required this.effect,
    required this.unit,
    required this.iconName,
    required this.districtName,
    required this.districtTotalUser,
    required this.seoulTotalUser,
  });
  final String name, effectType, effect, unit, iconName, districtName;
  final int index, districtTotalUser, seoulTotalUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          iconName,
          width: MediaQuery.of(context).size.width / 8,
          height: MediaQuery.of(context).size.width / 8,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 60,
        ),
        if (index == 0) ...[
          RichText(
            text: TextSpan(
              text: "",
              style: Theme.of(context).textTheme.headlineSmall,
              children: <TextSpan>[
                TextSpan(
                  text: "$name님, ",
                ),
                TextSpan(
                  text: "$effectType $effect$unit를",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "",
              style: Theme.of(context).textTheme.labelMedium,
              children: const <TextSpan>[
                TextSpan(
                  text: "원마일 그린을 통해",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: " 지켰어요!"),
              ],
            ),
          ),
        ] else if (index == 1) ...[
          RichText(
            text: TextSpan(
              text: "",
              style: Theme.of(context).textTheme.headlineSmall,
              children: <TextSpan>[
                TextSpan(
                  text: districtName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: "에서 "),
                TextSpan(
                  text: "$districtTotalUser",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: "명의 이웃과 함께"),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "",
              style: Theme.of(context).textTheme.labelMedium,
              children: <TextSpan>[
                TextSpan(
                  text: "$effectType $effect$unit",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: " 만큼 절약했어요!"),
              ],
            ),
          ),
        ] else if (index == 2) ...[
          RichText(
            text: TextSpan(
              text: "",
              style: Theme.of(context).textTheme.headlineSmall,
              children: <TextSpan>[
                const TextSpan(
                  text: "서울시",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: "에서 "),
                TextSpan(
                  text: "$seoulTotalUser",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: "명의 시민들과 함께"),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "",
              style: Theme.of(context).textTheme.labelMedium,
              children: <TextSpan>[
                TextSpan(
                  text: "$effectType $effect$unit",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: " 만큼 절약했어요!"),
              ],
            ),
          ),
        ],
        SizedBox(
          height: MediaQuery.of(context).size.height / 80,
        ),
      ],
    );
  }
}
