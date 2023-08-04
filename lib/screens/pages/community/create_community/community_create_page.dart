import 'package:flutter/material.dart';
import 'package:onemilegreen_front/screens/pages/community/create_community/community_create_first_page.dart';
import 'package:onemilegreen_front/screens/pages/community/create_community/community_create_second_page.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/widgets/common/back_arrow_appbar.dart';

class CommunityCreatePage extends StatefulWidget {
  const CommunityCreatePage({super.key});

  @override
  State<CommunityCreatePage> createState() => _CommunityCreatePageState();
}

class _CommunityCreatePageState extends State<CommunityCreatePage> {
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
          CommunityCreateFirstPage(onNext: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }),
          const CommunityCreateSecondPage(),
        ],
      ),
    );
  }
}
