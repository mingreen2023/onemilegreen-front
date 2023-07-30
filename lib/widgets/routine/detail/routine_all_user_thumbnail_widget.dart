import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/models/routnine_get_userauth_model.dart';
import 'package:onemilegreen_front/services/dio_service.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/images.dart';
import 'package:onemilegreen_front/util/util.dart';
import 'package:onemilegreen_front/widgets/common/image_loader_widget.dart';
import 'package:onemilegreen_front/widgets/routine/detail/routine_all_user_detail_widget.dart';

class RoutineAllUserThumbnailWidget extends StatelessWidget {
  Future<GetUserAuth> futureAlluserRoutine =
      DioServices.getAllUserRoutine(rouId: 3);

  BoxDecoration buildContainerDecoration() {
    return BoxDecoration(
      border: Border.all(color: OmgColors.cardColor),
      borderRadius: BorderRadius.circular(5),
    );
  }

  RoutineAllUserThumbnailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureAlluserRoutine,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Row(
                children: snapshot.data!.data.routineDetails
                    .take(3)
                    .map((routineDetail) {
                  return Container(
                    width: 100.w,
                    height: 100.w,
                    margin: EdgeInsets.only(right: 5.w),
                    decoration: buildContainerDecoration(),
                    child: ImageLoaderWidget(
                      "${Util.domain}${routineDetail.urdImage}",
                    ),
                  );
                }).toList(),
              ),
              // 참가자 인증 사진 바로 확인하기
              SizedBox(
                height: 15.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RoutineAllUserDetailWidget(
                            snapshot.data!.data.routineDetails),
                        fullscreenDialog: true),
                  );
                },
                child: Image.asset(
                  Images.routineCheck,
                  width: 324.w,
                  height: 42.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          );
        }
        return Column(
          children: [
            Row(
              children: <Widget>[
                for (var i = 0; i < 3; i++) ...[
                  Image.asset(
                    Images.routineAuthPlaceholder,
                    width: 100.w,
                    height: 100.w,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ],
            ),
            // 참가자 인증 사진 바로 확인하기
            SizedBox(
              height: 15.h,
            ),
            Image.asset(
              Images.routineCheck,
              width: 324.w,
              height: 42.h,
              fit: BoxFit.contain,
            ),
          ],
        );
      }),
    );
  }
}
