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
  static const String btGatheringActive = "${imagePath}bt_gathering_active.png";
  static const String btGathering = "${imagePath}bt_gathering.png";
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

// gathering
  static const String gatheringAdd = "${imagePath}gathering_add.png";
  static const String gatheringShare = "${imagePath}gathering_share.png";
  static const String gatheringPersonB = "${imagePath}gathering_person_b.png";
  static const String gatheringPersonW = "${imagePath}gathering_person_w.png";

// general
  static const String arrowBack = "${imagePath}arrow_back.png";
  static const String iconO = "${imagePath}icon_o.png";
  static const String iconX = "${imagePath}icon_x.png";
  static const String chevronBack = "${imagePath}chevron_back.png";
  static const String chevronForward = "${imagePath}chevron_forward.png";
}