import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/util/theme.dart';

class GreenEffectCardWidget extends StatefulWidget {
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
  State<GreenEffectCardWidget> createState() => _GreenEffectCardWidgetState();
}

class _GreenEffectCardWidgetState extends State<GreenEffectCardWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  List<String> districtImages = [
    Images.mainDistrictFirst,
    Images.mainDistrictSecond,
    Images.mainDistrictThird
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _animation =
        Tween<Offset>(begin: const Offset(0, -0.3), end: const Offset(0, 0))
            .animate(_animationController);

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: widget.index > 0
                  ? Image.asset(
                      Images.chevronBack,
                      width: 7.w,
                      height: 11.w,
                    )
                  : SizedBox(
                      width: 7.w,
                    ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SlideTransition(
                  position: _animation,
                  child: Image.asset(
                    widget.iconName,
                    width: 56.w,
                    height: 56.w,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                if (widget.index == 0) ...[
                  RichText(
                    text: TextSpan(
                      text: "",
                      style: CustomTextStyle.mainMsgHead,
                      children: <TextSpan>[
                        TextSpan(
                          text: "${widget.name}님, ",
                        ),
                        TextSpan(
                          text:
                              "${widget.effectType} ${widget.effect}${widget.unit}를",
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
                ] else if (widget.index == 1) ...[
                  RichText(
                    text: TextSpan(
                      text: "",
                      style: CustomTextStyle.mainMsgHead,
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.districtName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: "에서 "),
                        TextSpan(
                          text: "${widget.districtTotalUser}",
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
                          text:
                              "${widget.effectType} ${widget.effect}${widget.unit}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: " 만큼 절약했어요!"),
                      ],
                    ),
                  ),
                ] else if (widget.index == 2) ...[
                  RichText(
                    text: TextSpan(
                      text: "",
                      style: CustomTextStyle.mainMsgHead,
                      children: <TextSpan>[
                        const TextSpan(
                          text: "서울시",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: "에서 "),
                        TextSpan(
                          text: "${widget.seoulTotalUser}",
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
                          text:
                              "${widget.effectType} ${widget.effect}${widget.unit}",
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
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: widget.index < 2
                  ? Image.asset(
                      Images.chevronForward,
                      width: 7.w,
                      height: 11.w,
                    )
                  : SizedBox(
                      width: 7.w,
                    ),
            ),
          ],
        ),
        SizedBox(
          height: 37.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (var index = 0; index < 3; index++)
              Container(
                width: 5.w,
                height: 5.w,
                margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(widget.index == index ? 0.9 : 0.4)),
              ),
          ],
        ),
        Image.asset(
          districtImages[widget.index],
          width: MediaQuery.of(context).size.width,
          height: 277.h,
          fit: BoxFit.fitHeight,
        ),
        // TODO
        // AnimatedSize(
        //   curve: Curves.easeOut,
        //   duration: const Duration(milliseconds: 500),
        //   child:
        // ),
      ],
    );
  }
}
