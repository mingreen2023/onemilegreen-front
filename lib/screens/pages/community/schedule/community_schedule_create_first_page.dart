import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:onemilegreen_front/util/constants.dart';
import 'package:onemilegreen_front/util/form_validation.dart';
import 'package:onemilegreen_front/util/theme.dart';
import 'package:onemilegreen_front/widgets/common/underlined_text_input_widget.dart';

class CommunityCreateScheduleFirstPage extends StatefulWidget {
  Function() onNext;
  CommunityCreateScheduleFirstPage({super.key, required this.onNext});

  @override
  State<CommunityCreateScheduleFirstPage> createState() =>
      _CommunityCreateScheduleFirstPageState();
}

class _CommunityCreateScheduleFirstPageState
    extends State<CommunityCreateScheduleFirstPage> {
  // Variables to hold the selected value
  String? scheduleTitle;
  String? scheduleLocation;
  String? scheduleDateTime;

  Widget buildTitle(String title) => Text(
        title,
        style: CustomTextStyle.createComName,
      );

  String onTitleChanged(String text) {
    setState(() {
      scheduleTitle = text;
    });

    return text;
  }

  String onLocationChanged(String text) {
    setState(() {
      scheduleLocation = text;
    });

    return text;
  }

  @override
  void initState() {
    super.initState();

    scheduleDateTime = DateTime.now().toString();
  }

  @override
  Widget build(BuildContext context) {
    final formValidation = FormValidation(
      selectedPeople: scheduleTitle,
      selectedCategory: scheduleLocation,
      inputText: scheduleDateTime,
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
            "원마일그린에서 만든 모임의\n상세 일정 정보를 입력해주세요.",
            style: CustomTextStyle.createComGuide,
          ),
          SizedBox(
            height: 40.h,
          ),
          // 일정명 >>>
          buildTitle("일정명"),
          SizedBox(
            height: 7.h,
          ),
          UnderlinedTextInputWidget(
            hintText: "일정명 입력",
            onChanged: onTitleChanged,
          ),
          SizedBox(
            height: 28.h,
          ),
          // 일정명 />>>

          // 모임장소 >>>
          buildTitle("모임장소"),
          SizedBox(
            height: 7.h,
          ),
          UnderlinedTextInputWidget(
            hintText: "장소 입력",
            onChanged: onLocationChanged,
          ),
          SizedBox(
            height: 28.h,
          ),
          // 모임장소 />>>

          // 날짜 / 시간 >>>
          buildTitle("날짜 / 시간"),
          SizedBox(
            height: 7.h,
          ),
          SizedBox(
            width: double.maxFinite,
            height: 80.h,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime value) {
                setState(() {
                  scheduleDateTime =
                      value.toString(); // 2023-08-09 20:33:00.000
                });
              },
            ),
          ),

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
