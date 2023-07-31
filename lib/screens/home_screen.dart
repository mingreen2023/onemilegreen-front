import 'package:flutter/material.dart';
import 'package:onemilegreen_front/screens/pages/community_create_page.dart';
import 'package:onemilegreen_front/screens/pages/community_page.dart';
import 'package:onemilegreen_front/screens/pages/green_city_page.dart';
import 'package:onemilegreen_front/screens/pages/my_page.dart';
import 'package:onemilegreen_front/screens/pages/routine_page.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/util/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const GreenCityPage(),
    RoutinePage(),
    CommunityPage(),
    const MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: _widgetOptions[_selectedIndex],
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
                selIcon: Images.btCommunityActive,
                unselIcon: Images.btCommunity,
                label: community,
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
      floatingActionButton: _selectedIndex == 2
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CommunityCreatePage(),
                      fullscreenDialog: true),
                );
              },
              label: const Text(
                '모임 만들기',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              icon: const Icon(Icons.add),
              backgroundColor: OmgColors.primaryColor,
            )
          : null,
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
        child: Center(
          child: Image.asset(
            unselIcon,
            width: size,
            height: size,
          ),
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Center(
          child: Image.asset(
            selIcon,
            width: size,
            height: size,
          ),
        ),
      ),
      label: label,
    );
  }
}
