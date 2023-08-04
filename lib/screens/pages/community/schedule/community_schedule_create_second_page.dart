import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/util/theme.dart';

class CommunityCreateScheduleSecondPage extends StatefulWidget {
  const CommunityCreateScheduleSecondPage({super.key});

  @override
  State<CommunityCreateScheduleSecondPage> createState() =>
      _CommunityCreateScheduleSecondPageState();
}

class _CommunityCreateScheduleSecondPageState
    extends State<CommunityCreateScheduleSecondPage> {
  String? selectedPeople;
  String? scheduleContents;

  Widget buildTitle(String title) => Text(
        title,
        style: CustomTextStyle.createComName,
      );

  String onChanged(String text) {
    setState(() {
      scheduleContents = text;
    });

    return text;
  }

  List<String> peopleList = [
    "5인",
    "10인",
    "15인",
    "20인",
    "25인",
    "30인",
    "35인",
    "40인",
    "45인",
    "50인"
  ];

  @override
  void initState() {
    super.initState();
    selectedPeople = peopleList.first;
  }

  Widget choiceChipList(
      List<String> choices, String? selectedChoice, Function onSelect) {
    return Wrap(
      spacing: 7.w,
      runSpacing: 5.h,
      children: choices.map((String choice) {
        return ChoiceChip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          label: Text(choice),
          pressElevation: 1,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: selectedChoice == choice
                  ? OmgColors.primaryColor
                  : OmgColors.chipGreyColor,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.white,
          selectedColor: Colors.white,
          selected: selectedChoice == choice,
          labelStyle: TextStyle(
            color: selectedChoice == choice
                ? OmgColors.primaryColor
                : OmgColors.chipGreyColor,
            fontWeight:
                selectedChoice == choice ? FontWeight.w600 : FontWeight.w500,
          ),
          onSelected: (bool selected) {
            setState(() {
              onSelect(choice);
            });
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(margin_side),
      width: double.maxFinite,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "일정 상세 정보",
          style: CustomTextStyle.createComTitle,
        ),
        SizedBox(
          height: 32.h,
        ),
        buildTitle("활동 인원"),
        SizedBox(
          height: 7.h,
        ),
        choiceChipList(
            peopleList, selectedPeople, (value) => selectedPeople = value),
        SizedBox(
          height: 32.h,
        ),
        buildTitle("활동 상세내용"),
        SizedBox(
          height: 18.h,
        ),
        Container(
          height: 100.h,
          constraints: BoxConstraints.expand(
            width: double.maxFinite,
            height: 100.h,
          ),
          child: TextField(
            minLines: 5,
            maxLines: null,
            decoration: InputDecoration(
              hintText: '활동 내용에 관해 입력해주세요',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Color(0xffB9B9B9),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Color(0xffB9B9B9),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: OmgColors.primaryColor,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return const Color(0xffB5B5B5);
                      } else {
                        return Colors.black;
                      }
                    },
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(double.maxFinite, 50.h),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "완료",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 34.h,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
