import 'package:flutter/material.dart';
import 'package:onemilegreen_front/screens/pages/gathering_page.dart';
import 'package:onemilegreen_front/screens/pages/green_city_page.dart';
import 'package:onemilegreen_front/screens/pages/my_page.dart';
import 'package:onemilegreen_front/screens/pages/routine_page.dart';
import 'package:onemilegreen_front/util/constants.dart';

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
                selIcon: 'bt_green_city_active', // TODO: replace icon
                unselIcon: 'bt_green_city',
                label: greenSeoul,
                size: bottomIconSize),
            barItemBuilder(
                selIcon: 'bt_routine_active',
                unselIcon: 'bt_routine',
                label: routine,
                size: bottomIconSize),
            // TODO: fix icon later
            const BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Icon(
                  Icons.people_outline_rounded,
                  size: bottomIconSize,
                ),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Icon(
                  Icons.people_outline_rounded,
                  size: bottomIconSize,
                ),
              ),
              label: gathering,
            ),
            barItemBuilder(
                selIcon: 'bt_mypage_active',
                unselIcon: 'bt_mypage',
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
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Image(
          image: AssetImage('assets/images/$unselIcon.png'),
          width: size,
          height: size,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Image.asset(
          'assets/images/$selIcon.png',
          width: size,
          height: size,
        ),
      ),
      label: label,
    );
  }
}
