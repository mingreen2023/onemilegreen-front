import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:onemilegreen_front/models/green_seoul_status_model.dart';
import 'package:onemilegreen_front/services/api_service.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/widgets/main_effect_widget.dart';
import 'package:onemilegreen_front/widgets/main_user_info_widget.dart';
import 'package:onemilegreen_front/util/util.dart';

class GreenCityPage extends StatefulWidget {
  const GreenCityPage({super.key});

  @override
  State<GreenCityPage> createState() => _GreenCityPageState();
}

class _GreenCityPageState extends State<GreenCityPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  // TODO : refactoring
  int cardCount = 3;
  late UserInfoWidget userInfoWidget;
  late List<GreenEffectCardWidget> greenEffectList;
  Future<GreenSeoulStatusModel> futureGreenStatus =
      ApiService.getGreenSeoulStatus(userNo: "1");

  // TODO: manage user info
  String userName = "서하";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top - info
        Flexible(
          flex: 3,
          child: FutureBuilder(
              future: futureGreenStatus,
              builder: (context, greenStatus) {
                if (greenStatus.hasData) {
                  return UserInfoWidget(
                      nickName: '서하',
                      userMileage: greenStatus.data!.userMileage.toString());
                } else {
                  return const Center();
                }
              }),
        ),

        // Middle~Bottom - swipe
        Flexible(
          flex: 7,
          child: FutureBuilder(
              future: futureGreenStatus,
              builder: (context, greenStatus) {
                if (greenStatus.hasData) {
                  greenEffectList =
                      greenEffectCardListBuilder(greenStatus.data!);

                  return CarouselSlider(
                    items: <Widget>[
                      for (var i = 0; i < 3; i++)
                        Column(
                          children: [
                            greenEffectList[i],
                            IndicatorWidget(
                                controller: _controller, current: _current),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            Image.asset(Images.mainDistrict,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fitWidth),
                          ],
                        )
                    ],
                    carouselController: _controller,
                    options: CarouselOptions(
                        // fix error !
                        height: double.maxFinite,
                        animateToClosest: true,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ],
    );
  }

  List<GreenEffectCardWidget> greenEffectCardListBuilder(
      GreenSeoulStatusModel greenStatus) {
    List<GreenEffectCardWidget> greenEffectList = [];

    int userEffect = greenStatus.userEffect; // 사용자 환경보호효과
    int districtTotalEffect =
        greenStatus.districtTotalEffect; // 사용자가 속한 지역구의 환경보호효과
    int seoulTotalEffect = greenStatus.seoulTotalEffect; // 서울 전체 환경보호효과
    int seoulTotalUser = greenStatus.seoulTotalUser; // 서울 전체 사용자 수
    String districtName = greenStatus.districtName; // 지역구 명
    int districtTotalUser = greenStatus.districtTotalUser; // 사용자가 속한 지역구의 사용자 수

    // user
    // effect: userEffect
    CalculatedEffect userCalEffect = pickRandomResult(userEffect);
    greenEffectList.add(GreenEffectCardWidget(
      index: 0,
      name: userName,
      effectType: userCalEffect.effectType.name,
      effect: userCalEffect.calEffect.toString(),
      unit: userCalEffect.unit,
      iconName: userCalEffect.effectType.iconName,
      districtName: districtName,
      districtTotalUser: districtTotalUser,
      seoulTotalUser: seoulTotalUser,
    ));

    // district
    // effect: districtTotalEffect
    CalculatedEffect districtEffect = pickRandomResult(districtTotalEffect);
    greenEffectList.add(GreenEffectCardWidget(
      index: 1,
      name: userName,
      effectType: districtEffect.effectType.name,
      effect: districtEffect.calEffect.toString(),
      unit: districtEffect.unit,
      iconName: districtEffect.effectType.iconName,
      districtName: districtName,
      districtTotalUser: districtTotalUser,
      seoulTotalUser: seoulTotalUser,
    ));
    // seoul
    // effect: seoulTotalEffect

    CalculatedEffect seoulEffect = pickRandomResult(seoulTotalEffect);
    greenEffectList.add(GreenEffectCardWidget(
      index: 2,
      name: userName,
      effectType: seoulEffect.effectType.name,
      effect: seoulEffect.calEffect.toString(),
      unit: seoulEffect.unit,
      iconName: seoulEffect.effectType.iconName,
      districtName: districtName,
      districtTotalUser: districtTotalUser,
      seoulTotalUser: seoulTotalUser,
    ));

    return greenEffectList;
  }
}

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    super.key,
    required CarouselController controller,
    required int current,
  })  : _controller = controller,
        _current = current;

  final CarouselController _controller;
  final int _current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (var index = 0; index < 3; index++)
          GestureDetector(
            onTap: () => _controller.animateToPage(index),
            child: Container(
              width: 5.0,
              height: 5.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == index ? 0.9 : 0.4)),
            ),
          ),
      ],
    );
  }
}
