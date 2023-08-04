import 'package:flutter/material.dart';
import 'package:onemilegreen_front/screens/pages/community/schedule/community_schedule_create_first_page.dart';
import 'package:onemilegreen_front/screens/pages/community/schedule/community_schedule_create_second_page.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/widgets/common/back_arrow_appbar.dart';

class CommunityScheduleCreatePage extends StatefulWidget {
  const CommunityScheduleCreatePage({super.key});

  @override
  State<CommunityScheduleCreatePage> createState() =>
      _CommunityScheduleCreatePageState();
}

class _CommunityScheduleCreatePageState
    extends State<CommunityScheduleCreatePage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackArrowAppBar(
        title: '',
        icon: Images.chevronBack,
        onPressed: () {
          if (_pageController.hasClients && _pageController.page! > 0) {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          } else {
            Navigator.pop(context);
          }
        },
      ),
      body: PageView(
        controller: _pageController,
        physics:
            const NeverScrollableScrollPhysics(), // disable swipe to next page
        children: <Widget>[
          CommunityCreateScheduleFirstPage(onNext: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }),
          const CommunityCreateScheduleSecondPage(),
        ],
      ),
    );
  }
}
