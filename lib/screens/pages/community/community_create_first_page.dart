import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/util/form_validation.dart';
import 'package:onemilegreen_front/util/theme.dart';
import 'package:onemilegreen_front/widgets/common/underlined_text_input_widget.dart';

class CommunityCreateFirstPage extends StatefulWidget {
  Function() onNext;
  CommunityCreateFirstPage({super.key, required this.onNext});

  @override
  State<CommunityCreateFirstPage> createState() =>
      _CommunityCreateFirstPageState();
}

class _CommunityCreateFirstPageState extends State<CommunityCreateFirstPage> {
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
  List<String> categoryList = ["제로웨이스트", "친환경", "비건", "기부", "기타"];

  // Variables to hold the selected value
  String? selectedPeople;
  String? selectedCategory;
  String? inputText;

  String onChanged(String text) {
    setState(() {
      inputText = text;
    });

    return text;
  }

  Widget buildTitle(String title) => Text(
        title,
        style: CustomTextStyle.createComName,
      );

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
              onSelect(selected ? choice : null);
            });
          },
        );
      }).toList(),
    );
  }

  Widget fixedChip() => ChoiceChip(
        label: const Text("용산구"), // TODO: [FIX] user info
        pressElevation: 1,
        labelStyle: const TextStyle(color: OmgColors.primaryColor),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: OmgColors.primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: Colors.white,
        selectedColor: Colors.white,
        selected: true,
        onSelected: (bool selected) {},
      );

  @override
  Widget build(BuildContext context) {
    final formValidation = FormValidation(
      selectedPeople: selectedPeople,
      selectedCategory: selectedCategory,
      inputText: inputText,
    );

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: margin_side,
        vertical: 23.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "모임 상세 정보",
            style: CustomTextStyle.createComTitle,
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            "원마일그린에서 만들\n모임의 상세 정보를 입력해주세요.",
            style: CustomTextStyle.createComGuide,
          ),
          SizedBox(
            height: 40.h,
          ),
          buildTitle("모임명"),
          SizedBox(
            height: 7.h,
          ),
          // 모임명 >>>
          UnderlinedTextInputWidget(
            hintText: "모임명 입력",
            onChanged: onChanged,
          ),
          SizedBox(
            height: 28.h,
          ),
          // 모임지역 >>>
          buildTitle("모임지역"),
          SizedBox(
            height: 7.h,
          ),
          fixedChip(),
          SizedBox(
            height: 32.h,
          ),
          buildTitle("활동 카테고리"),
          SizedBox(
            height: 7.h,
          ),
          choiceChipList(categoryList, selectedCategory,
              (value) => selectedCategory = value),
          SizedBox(
            height: 32.h,
          ),
          buildTitle("모임 인원"),
          SizedBox(
            height: 7.h,
          ),
          choiceChipList(
              peopleList, selectedPeople, (value) => selectedPeople = value),
          SizedBox(
            height: 32.h,
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
                  onPressed:
                      formValidation.formState == CommunityFormState.Complete
                          ? () {
                              logger.d(formValidation.formValues);
                              widget.onNext();
                            }
                          : null,
                  child: Text(
                    "다음으로",
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
          )
        ],
      ),
    );
  }
}
