import 'package:flutter/material.dart';
import 'package:onemilegreen_front/screens/pages/gathering_page.dart';
import 'package:onemilegreen_front/screens/pages/green_city_page.dart';
import 'package:onemilegreen_front/screens/pages/my_page.dart';
import 'package:onemilegreen_front/screens/pages/routine_page.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/util/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    GreenCityPage(),
    RoutinePage(),
    GatheringPage(),
    MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(color: Colors.grey.shade300, width: 1.0))),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            barItemBuilder(
                selIcon: Images.btGreenCityActive,
                unselIcon: Images.btGreenCity,
                label: greenSeoul,
                size: bottomIconSize),
            barItemBuilder(
                selIcon: Images.btRoutineActive,
                unselIcon: Images.btRoutine,
                label: routine,
                size: bottomIconSize),
            barItemBuilder(
                selIcon: Images.btGatheringActive,
                unselIcon: Images.btGathering,
                label: gathering,
                size: bottomIconSize),
            barItemBuilder(
                selIcon: Images.btMypageActive,
                unselIcon: Images.btMypage,
                label: myPage,
                size: bottomIconSize - 5),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  BottomNavigationBarItem barItemBuilder({
    required String selIcon,
    required String unselIcon,
    required String label,
    required double size,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Image.asset(
          unselIcon,
          width: size,
          height: size,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Image.asset(
          selIcon,
          width: size,
          height: size,
        ),
      ),
      label: label,
    );
  }
}
