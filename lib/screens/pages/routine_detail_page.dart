import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:onemilegreen_front/models/routine_detail_model.dart';
import 'package:onemilegreen_front/models/routine_single_model.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/widgets/back_arrow_appbar.dart';

class RoutineDetailPage extends StatefulWidget {
  final int rouId;
  const RoutineDetailPage(
    this.rouId, {
    super.key,
  });

  @override
  State<RoutineDetailPage> createState() => _RoutineDetailPageState();
}

class _RoutineDetailPageState extends State<RoutineDetailPage>
    with TickerProviderStateMixin {
  // TODO : refactoring
  Future<SingleRoutineModel> futureRoutineItem =
      DioServices.getRoutineItem(userNo: "1", rouId: 3);

  // TODO: manage user info
  String userName = "서하";
  late TabController _tabController;

  double tabBarHeight = 58;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackArrowAppBar(
        title: '루틴 상세',
        leadingImageAsset: Images.arrowBack,
        onPressedLeadingIcon: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: FutureBuilder(
            future: futureRoutineItem,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top - Routine info
                    RoutineDetailTopInfoWidget(
                      snapshot.data!.data,
                      key: Key('infoWidget${snapshot.data!.data.rouId}'),
                    ),

                    RoutineCalWidget(
                      snapshot.data!.data,
                      key: Key('calWidget${snapshot.data!.data.rouId}'),
                    ),

                    // TabView >>>
                    RoutineDetailTabViewWidget(
                      tabBarHeight: tabBarHeight,
                      tabController: _tabController,
                      data: snapshot.data!.data,
                    ),
                  ],
                );
              }
              // TODO: fix loading effect
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top - Routine info
                  RoutineDetailTopInfoWidget(RoutineDetailModel()),

                  RoutineCalWidget(RoutineDetailModel()),

                  // TabBar >>>
                  RoutineDetailTabViewWidget(
                    tabBarHeight: tabBarHeight,
                    tabController: _tabController,
                    data: RoutineDetailModel(),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class RoutineCalWidget extends StatefulWidget {
  final RoutineDetailModel routineDetailModel;

  const RoutineCalWidget(
    this.routineDetailModel, {
    super.key,
  });

  @override
  State<RoutineCalWidget> createState() => _RoutineCalWidgetState();
}

class _RoutineCalWidgetState extends State<RoutineCalWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<Widget> list = [
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
      for (var i = 0; i < 7; i++) ...[
        SizedBox(
          width: 37.w,
          height: 37.h,
          child: Stack(
            children: <Widget>[
              Image.asset(Images.calSuccess),
              const Center(
                child: Text(
                  '27',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ]),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
      for (var i = 0; i < 7; i++) ...[
        SizedBox(
          width: 37.w,
          height: 37.h,
          child: Stack(
            children: <Widget>[
              Image.asset(Images.calSuccess),
              const Center(
                child: Text(
                  '27',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: lineGreyColor),
            ),
          ),
          padding: EdgeInsets.only(
            top: 27.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const ImageIcon(
                  color: arrowGreyColor,
                  AssetImage(
                    Images.chevronBack,
                  ),
                ),
                iconSize: 11.h,
                onPressed: () {
                  _controller.previousPage();
                },
              ),
              SizedBox(
                width: 24.w,
              ),
              Text(
                "루틴 ${_current + 1}주차",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 24.w,
              ),
              IconButton(
                icon: const ImageIcon(
                  color: arrowGreyColor,
                  AssetImage(
                    Images.chevronForward,
                  ),
                ),
                iconSize: 11.h,
                onPressed: () {
                  _controller.nextPage();
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        CarouselSlider(
          items: list,
          carouselController: _controller,
          options: CarouselOptions(
              height: 37.h,
              animateToClosest: true,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }
}

class RoutineDetailTabViewWidget extends StatelessWidget {
  RoutineDetailTabViewWidget({
    super.key,
    required this.tabBarHeight,
    required TabController tabController,
    required this.data,
  }) : _tabController = tabController;
  RoutineDetailModel data;
  final double tabBarHeight;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: cardColor,
                    width: 1.0), // Set border color and width as needed.
              ),
            ),
            child: TabBar(
              tabs: [
                Container(
                  height: tabBarHeight,
                  padding: const EdgeInsets.only(bottom: 10),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '인증사진 가이드',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  height: tabBarHeight,
                  padding: const EdgeInsets.only(bottom: 10),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '참가자 인증현황',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
              indicatorWeight: 1.5,
              indicatorColor: primaryColor,
              labelColor: Colors.black,
              unselectedLabelColor: const Color(0xFFA1A1A1),
              controller: _tabController,
            ),
          ),
          // TabBarView >>>
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const RoutineAuthTabWidget(),
                RoutinePeopleTabWidget(data: data),
              ],
            ),
          ),
          const PrimaryColorRoundButtonWidget("참가하기"),
        ],
      ),
    );
  }
}

class RoutineDetailTopInfoWidget extends StatelessWidget {
  final RoutineDetailModel data;
  const RoutineDetailTopInfoWidget(
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${data.rouDayofweek} / ${data.rouStDate} - ${data.rouEndDate}",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: scheduleLabelColor,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          data.rouName,
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 23.h,
        ),
        Text(
          "${data.rouStDate}부터 ${data.rouEndDate}",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 14.h,
        ),
        Text(
          "${data.rouUserCount}명 참여중",
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class RoutineAuthTabWidget extends StatelessWidget {
  const RoutineAuthTabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 26.h,
        ),
        Text(
          "인증 사진 가이드",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Text(
          "포인트를 받기 위해 다음의 가이드를 지켜주세요",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            color: titleGreyColor,
          ),
        ),
        SizedBox(
          height: 11.h,
        ),
        // 인증 예시 이미지
        Row(
          children: [
            Stack(
              children: [
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: SizedBox(
                    width: 30.w,
                    height: 30.h,
                    child: Image.asset(Images.iconX),
                  ),
                ),
                Container(
                  width: 154.w,
                  height: 154.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: cardColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 12.w,
            ),
            Stack(children: [
              Positioned(
                bottom: 10,
                right: 10,
                child: SizedBox(
                  width: 30.w,
                  height: 30.h,
                  child: Image.asset(Images.iconO),
                ),
              ),
              Container(
                width: 154.w,
                height: 154.h,
                decoration: BoxDecoration(
                  border: Border.all(color: cardColor),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ]),
          ],
        ),
        SizedBox(
          height: 13.h,
        ),
        Container(
          width: double.maxFinite,
          height: 71.h,
          color: textGreyColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "· 투명 음료를 다는 페트병인가요? (양념류 통 불가)\n· 투명 플라스틱 겉면에 이물질이 없나요?\n· 내용물이 비었나요?",
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w300,
                color: mainSecondTextColor,
                height: 1.5,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 70.h,
        ),
      ],
    );
  }
}

class RoutinePeopleTabWidget extends StatelessWidget {
  final RoutineDetailModel data;

  const RoutinePeopleTabWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 26.h,
        ),
        Text(
          "참가자 인증 현황",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Text(
          "다른 참가자의 인증 현황을 확인해보세요",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            color: titleGreyColor,
          ),
        ),
        SizedBox(
          height: 24.h,
        ),

        // If joined == true,
        if (data.isJoined == 1) ...[
          const RoutineDetailJoinedStatusWidget(),
        ] else ...[
          // 루틴 참여하고 사진 바로 확인하기
          InkWell(
            onTap: () {
              print("Image tapped!");
            },
            child: Image.asset(
              Images.routineJoinToCheck, // Replace with your image path
              width: 324.w,
              height: 42.h,
              fit: BoxFit.cover,
            ),
          ),
        ]
      ],
    );
  }
}

class RoutineDetailJoinedStatusWidget extends StatelessWidget {
  const RoutineDetailJoinedStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            for (var i = 0; i < 3; i++) ...[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.h,
                ),
                child: InkWell(
                  onTap: () {
                    print("Image tapped!");
                  },
                  child: Image.asset(
                    Images.routineAuthPlaceholder,
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
            ],
          ],
        ),
        // 참가자 인증 사진 바로 확인하기
        InkWell(
          onTap: () {
            print("Image tapped!");
          },
          child: Image.asset(
            Images.routineCheck,
            width: 324.w,
            height: 42.h,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class PrimaryColorRoundButtonWidget extends StatelessWidget {
  final String text;
  const PrimaryColorRoundButtonWidget(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(
        bottom: 40.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
      ),
      width: double.maxFinite,
      height: 50.h,
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
