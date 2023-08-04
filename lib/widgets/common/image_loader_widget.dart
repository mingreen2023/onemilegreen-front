import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/util/util.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoaderWidget extends StatelessWidget {
  final String url;
  late double defaultWidth;
  late double defaultHeight;
  double? width;
  double? height;
  BoxFit fit;

  ImageLoaderWidget(
    this.url, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  String validateUrl(String url) {
    String s3BucketUrl = Util.domain;

    // url이 s3BucketUrl로 시작하고 이어서 'http'로 시작하는 경우
    if (url.startsWith(s3BucketUrl) &&
        url.substring(s3BucketUrl.length).startsWith('http')) {
      String fixedUrl = url.substring(s3BucketUrl.length);
      return fixedUrl;
    }

    // url이 파일명만 있는 경우
    RegExp expr = RegExp(r"\.(jpeg|jpg|gif|png)");
    if (!url.startsWith(s3BucketUrl) && expr.hasMatch(url)) {
      return s3BucketUrl + url;
    }

    return url;
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: validateUrl(url),
      fit: fit,
      width: width ?? 156.w,
      height: height ?? 156.w,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: OmgColors.cardColor,
        highlightColor: Colors.white,
        child: Container(
          color: OmgColors.cardColor,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
