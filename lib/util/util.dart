import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:onemilegreen_front/models/community_schedule_model.dart';
import 'package:onemilegreen_front/models/routine_detail_model.dart';
import 'package:onemilegreen_front/models/week_calendar_model.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

class Util {
  static final domain = dotenv.get("S3_DOMAIN");

  static Widget ShimmerBuilder(Widget widget) {
    return Shimmer.fromColors(
      baseColor: OmgColors.cardColor,
      highlightColor: Colors.white,
      child: widget,
    );
  }

  static Future<MultipartFile?> getFile() async {
    ImagePicker picker = ImagePicker();
    XFile? selectImage = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 510,
      maxWidth: 510,
      imageQuality: 50,
    );

    if (selectImage != null) {
      String sendData = selectImage.path;
      String mimeType = mime(selectImage.name) ?? '';
      String mimee = mimeType.split('/')[0];
      String type = mimeType.split('/')[1];

      logger.d("sendData: $sendData");
      logger.d("selectImage.name: ${selectImage.name}.");
      logger.d("mimeType: $mimeType.");

      MultipartFile file = await MultipartFile.fromFile(
        sendData,
        filename: selectImage.name,
        contentType: MediaType(
          mimee,
          type,
        ),
      );

      return file;
    } else {
      return null;
    }
  }
}

enum EffectType { Tree, Plastic, PaperCup }

extension EffectTypeName on EffectType {
  String get name {
    switch (this) {
      case EffectType.Tree:
        return "나무";
      case EffectType.Plastic:
        return "플라스틱";
      case EffectType.PaperCup:
        return "종이컵";
      default:
        return "Unknown";
    }
  }
}

extension EffectTypeIconName on EffectType {
  String get iconName {
    switch (this) {
      case EffectType.Tree:
        return Images.mainMTree;
      case EffectType.Plastic:
        return Images.mainMPlastic;
      case EffectType.PaperCup:
        return Images.mainMCup;
      default:
        return "Unknown";
    }
  }
}

class CalculatedEffect {
  final EffectType effectType;
  final double calEffect;
  final String unit;
  final String iconName;

  CalculatedEffect({
    required this.effectType,
    required this.calEffect,
    required this.unit,
    required this.iconName,
  });
}

// TODO: remove or fix
List<CalculatedEffect> effectCalculator(int effect) {
  double tree = double.parse(
      (effect / 21.0).toStringAsFixed(1)); // 1그루 나무는 약 21kg CO2를 흡수
  double paperCup = double.parse(
      (effect / 0.110).toStringAsFixed(1)); // 1개의 종이컵은 대략 0.110g CO2
  double plastic = double.parse(
      (effect / 6.0).toStringAsFixed(1)); // 1kg의 플라스틱은 약 6kg CO2를 생산

  List<CalculatedEffect> calculatedEffects = [
    CalculatedEffect(
      effectType: EffectType.Tree,
      calEffect: tree,
      unit: "그루",
      iconName: EffectType.Tree.iconName,
    ),
    CalculatedEffect(
      effectType: EffectType.Plastic,
      calEffect: plastic,
      unit: "kg",
      iconName: EffectType.Plastic.iconName,
    ),
    CalculatedEffect(
      effectType: EffectType.PaperCup,
      calEffect: paperCup,
      unit: "개",
      iconName: EffectType.PaperCup.iconName,
    ),
  ];

  return calculatedEffects;
}

CalculatedEffect pickRandomResult(int effect) {
  List<CalculatedEffect> calculatedEffects = effectCalculator(effect);
  int randomIndex = Random().nextInt(calculatedEffects.length);
  return calculatedEffects[randomIndex];
}

class Formatter {
  static String formatDate(String date) {
    logger.d(date);
    String formattedDate = "";
    DateTime parsedDate = DateTime.parse(date);
    final formatter = DateFormat('M월 d일');
    formattedDate = formatter.format(parsedDate);

    return formattedDate;
  }

  // from 2023-07-28 11:00
  // to 07.28 11:00
  static String formatDateTime(String date) {
    String formattedDate = "";

    DateTime parsedDate = DateTime.parse(date);
    final formatter = DateFormat('MM.dd hh:mm');
    formattedDate = formatter.format(parsedDate);

    return formattedDate;
  }

  // from 2023-07-28 11:00
  // to 7월 n주차
  static String formatMonthWeekCount(String date) {
    DateTime parsedDate = DateTime.parse(date);

    int weekDayCount = parsedDate.day + (parsedDate.weekday - 1);
    int weekOfMonth = ((weekDayCount - 1) / 7).ceil();

    return '${parsedDate.month}월 $weekOfMonth주차';
  }

  // from 2023-07-28 11:00
  // to 4
  static int weekOfMonth(DateTime date) {
    DateTime firstDayThisMonth = DateTime(date.year, date.month, 1);
    int dayOfYearFirstDayThisMonth = firstDayThisMonth.day;
    int dayOfYearDate = date.day;
    return ((dayOfYearDate - dayOfYearFirstDayThisMonth) / 7).ceil() + 1;
  }

  static List<int> calculateWeeksBetweenMonth(firstDate, lastDate) {
    DateTime firstDateTime = DateTime.parse(firstDate);
    DateTime lastDateTime = DateTime.parse(lastDate);

    List<int> weekNumbers = [];

    // 첫번째 주
    int firstWeekOfMonth = weekOfMonth(firstDateTime);

    // 마지막 주
    int lastWeekOfMonth = weekOfMonth(lastDateTime);

    for (int i = firstWeekOfMonth; i <= lastWeekOfMonth; i++) {
      weekNumbers.add(i);
    }

    logger.d('Week numbers: $weekNumbers');

    return weekNumbers;
  }

  // 주별 달력 초기화
  static WeekCalendar createRoutineWeekCalendar(
      RoutineDetailModel routineDetailModel) {
    // status mapping
    Map<DateTime, int> routineStatusMap = {};
    routineDetailModel.rouDetailList?.forEach((routineCalendarModel) {
      DateTime date = DateTime.parse(routineCalendarModel.date);
      routineStatusMap[date] = routineCalendarModel.status;
    });

    String firstDate = routineDetailModel.rouStDate;
    String lastDate = routineDetailModel.rouEndDate;
    DateTime first = DateTime.parse(firstDate);
    DateTime last = DateTime.parse(lastDate);

    DateTime start = first;
    DateTime end = last;

    first = first.subtract(Duration(days: first.weekday - 1));
    last = last.add(Duration(days: 7 - last.weekday));

    Map<String, int> weekdayMapping = {
      "월": DateTime.monday,
      "화": DateTime.tuesday,
      "수": DateTime.wednesday,
      "목": DateTime.thursday,
      "금": DateTime.friday,
      "토": DateTime.saturday,
      "일": DateTime.sunday,
    };

    List<int> parsedDays = [];
    String rouDayofweek = routineDetailModel.rouDayofweek;

    if (rouDayofweek == "평일") {
      parsedDays = [
        DateTime.monday,
        DateTime.tuesday,
        DateTime.wednesday,
        DateTime.thursday,
        DateTime.friday
      ];
    } else if (rouDayofweek == "주말") {
      parsedDays = [DateTime.saturday, DateTime.sunday];
    } else {
      for (String weekday in weekdayMapping.keys) {
        if (rouDayofweek.contains(weekday)) {
          parsedDays.add(weekdayMapping[weekday]!);
        }
      }
    }

    Map<DateTime, int> scheduleDates = {};
    for (int j = 0; j <= last.difference(first).inDays; j++) {
      DateTime thisDay = first.add(Duration(days: j));
      scheduleDates[thisDay] = parsedDays.contains(thisDay.weekday) ? 1 : 0;
    }

    List<Week> weeks = [];
    int weekNumber = 1;
    String currentMonth = DateFormat('MM').format(first);

    for (int i = 0; i <= last.difference(first).inDays; i++) {
      DateTime currentDay = first.add(Duration(days: i));

      if (currentDay.weekday == DateTime.monday) {
        DateTime medianDay = currentDay.add(const Duration(days: 3));
        String month = DateFormat('MM').format(medianDay);

        if (month != currentMonth) {
          weekNumber = 1;
          currentMonth = month;
        }

        List<Day> days = [];
        for (int j = 0; j < 7; j++) {
          DateTime thisDay = currentDay.add(Duration(days: j));
          String imageAsset;
          if (DateTime.now().day == thisDay.day &&
              DateTime.now().month == thisDay.month &&
              DateTime.now().year == thisDay.year) {
            // 오늘
            imageAsset = Images.calToday;
          } else if (routineStatusMap[thisDay] == 0) {
            // 인증 실패
            imageAsset = Images.calFailed;
          } else {
            // 인증 예정
            imageAsset = scheduleDates[thisDay] == 1
                ? Images.calTodo
                : Images.calNotTodo;
          }

          days.add(Day(date: thisDay, imageAsset: imageAsset));
        }

        weeks.add(Week(
          weekNumber: weekNumber,
          month: month,
          days: days,
        ));
      }

      if (currentDay.weekday == DateTime.sunday) {
        weekNumber++;
      }
    }

    return WeekCalendar(
        startDate: start,
        endDate: end,
        firstDate: first,
        lastDate: last,
        weeks: weeks,
        routineDetailModel: routineDetailModel);
  }

  static int calculateWeeks(String startDate, String endDate) {
    DateTime start = DateTime.parse(startDate);
    DateTime end = DateTime.parse(endDate);

    int diffDays = end.difference(start).inDays;
    int weeks = (diffDays / 7).floor();

    return weeks;
  }

  // 주별 달력 초기화
  static WeekCalendar createWeekCalendar(List<ScheduleListItem> scheduleList) {
    String firstDate = scheduleList[0].schStDate;
    String lastDate = scheduleList.last.schEndDate;
    DateTime first = DateTime.parse(firstDate);
    DateTime last = DateTime.parse(lastDate);

    DateTime start = first;
    DateTime end = last;

    first = first.subtract(Duration(days: first.weekday - 1));
    last = last.add(Duration(days: 7 - last.weekday));

    Map<DateTime, bool> scheduleDates = {};
    for (var schedule in scheduleList) {
      var startDate = DateTime.parse(schedule.schStDate);
      var endDate = DateTime.parse(schedule.schEndDate);

      for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
        scheduleDates[startDate.add(Duration(days: i))] = true;
      }
    }

    List<Week> weeks = [];
    int weekNumber = 1;
    String currentMonth = DateFormat('MM').format(first);

    for (int i = 0; i <= last.difference(first).inDays; i++) {
      DateTime currentDay = first.add(Duration(days: i));

      if (currentDay.weekday == DateTime.monday) {
        DateTime medianDay = currentDay.add(const Duration(days: 3));
        String month = DateFormat('MM').format(medianDay);

        if (month != currentMonth) {
          weekNumber = 1;
          currentMonth = month;
        }

        List<Day> days = [];
        for (int j = 0; j < 7; j++) {
          DateTime thisDay = currentDay.add(Duration(days: j));
          String imageAsset;
          if (DateTime.now().day == thisDay.day &&
              DateTime.now().month == thisDay.month &&
              DateTime.now().year == thisDay.year) {
            imageAsset = Images.calToday;
          } else {
            imageAsset = scheduleDates[thisDay] ?? false
                ? Images.calTodo
                : Images.calNotTodo;
          }
          days.add(Day(date: thisDay, imageAsset: imageAsset));
        }

        weeks.add(Week(
          weekNumber: weekNumber,
          month: month,
          days: days,
        ));
      }

      if (currentDay.weekday == DateTime.sunday) {
        weekNumber++;
      }
    }

    return WeekCalendar(
      startDate: start,
      endDate: end,
      firstDate: first,
      lastDate: last,
      weeks: weeks,
    );
  }
}
