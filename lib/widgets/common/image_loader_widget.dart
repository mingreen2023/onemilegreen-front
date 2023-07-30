import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      width: width ?? 156.w,
      height: height ?? 156.w,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: cardColor,
        highlightColor: Colors.white,
        child: Container(
          color: cardColor,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
