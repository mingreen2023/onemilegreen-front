class Images {
  Images._();

  static String getImagePath(imgName) => "$imagePath$imgName";

  static const String imagePath = "assets/images/";

// bt
  static const String btGreenCityActive =
      "${imagePath}bt_green_city_active.png";
  static const String btGreenCity = "${imagePath}bt_green_city.png";
  static const String btRoutineActive = "${imagePath}bt_routine_active.png";
  static const String btRoutine = "${imagePath}bt_routine.png";
  static const String btCommunityActive = "${imagePath}bt_gathering_active.png";
  static const String btCommunity = "${imagePath}bt_gathering.png";
  static const String btMypage = "${imagePath}bt_mypage.png";
  static const String btMypageActive = "${imagePath}bt_mypage_active.png";

// main
  static const String mainDistrict = "${imagePath}main_district.png";
  static const String mainSeoul = "${imagePath}main_seoul.png";
  static const String mainMCup = "${imagePath}main_m_cup.png";
  static const String mainMTree = "${imagePath}main_m_tree.png";
  static const String mainTopArrow = "${imagePath}main_top_arrow.png";
  static const String mainTopMap = "${imagePath}main_top_map.png";

// routine
  static const String routineJoined = "${imagePath}routine_joined.png";
  static const String routineNotJoined = "${imagePath}routine_not_joined.png";
  static const String routineJoinToCheck = "${imagePath}btn_join_routine.png";
  static const String routineCheck = "${imagePath}btn_check_routine.png";

  static const String calSuccess = "${imagePath}cal_success.png";
  static const String calNotTodo = "${imagePath}cal_not_todo.png";
  static const String calTodo = "${imagePath}cal_todo.png";
  static const String calFailed = "${imagePath}cal_failed.png";
  static const String calToday = "${imagePath}cal_today.png";
  static const String routineAuthPlaceholder =
      "${imagePath}routine_auth_placeholder.png";
  static const String iconHeartFill = "${imagePath}icon_heart_fill.png";
  static const String iconHeartOutlined = "${imagePath}icon_heart_outline.png";

// gathering
  static const String gatheringAdd = "${imagePath}gathering_add.png";
  static const String gatheringShare = "${imagePath}gathering_share.png";
  static const String gatheringPersonB = "${imagePath}gathering_person_b.png";
  static const String gatheringPersonW = "${imagePath}gathering_person_w.png";

// common
  static const String arrowBack = "${imagePath}arrow_back.png";
  static const String iconO = "${imagePath}icon_o.png";
  static const String iconX = "${imagePath}icon_x.png";
  static const String chevronBack = "${imagePath}chevron_back.png";
  static const String chevronForward = "${imagePath}chevron_forward.png";
  static const String iconDots = "${imagePath}icon_dots.png";
}
