import 'package:onemilegreen_front/models/base_model.dart';

class RoutineFeed {
  final String userNick;
  final String urdImage;
  final int urdLike;

  RoutineFeed({
    required this.userNick,
    required this.urdImage,
    required this.urdLike,
  });

  factory RoutineFeed.fromJson(Map<String, dynamic> json) {
    return RoutineFeed(
      userNick: json['user_nick'],
      urdImage: json['urd_image'],
      urdLike: json['urd_like'],
    );
  }
}

class RoutineFeedListModel extends BaseModel {
  final List<RoutineFeed> routineDetails;

  RoutineFeedListModel({
    required int code,
    required String message,
    required this.routineDetails,
  }) : super(code: code, message: message);

  factory RoutineFeedListModel.fromJson(Map<String, dynamic> json) {
    var list = json['data']['routineDetails'] as List;
    List<RoutineFeed> routineDetailList =
        list.map((i) => RoutineFeed.fromJson(i)).toList();
    return RoutineFeedListModel(
      code: json['code'],
      message: json['message'],
      routineDetails: routineDetailList,
    );
  }
}
