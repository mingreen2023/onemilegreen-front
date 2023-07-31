import 'package:onemilegreen_front/models/base_model.dart';

class CommunityItemResponse extends BaseModel {
  final CommunityItemData data;

  CommunityItemResponse({
    required int code,
    required String message,
    required this.data,
  }) : super(code: code, message: message);

  factory CommunityItemResponse.fromJson(Map<String, dynamic> json) {
    return CommunityItemResponse(
      code: json['code'],
      message: json['message'],
      data: CommunityItemData.fromJson(json['data']),
    );
  }
}

class CommunityItemData {
  final CommunityItem communityItem;

  CommunityItemData({required this.communityItem});

  factory CommunityItemData.fromJson(Map<String, dynamic> json) {
    return CommunityItemData(
      communityItem: CommunityItem.fromJson(json['communityItem']),
    );
  }
}

class CommunityItem {
  final int comId;
  final String comName;
  final String comContent;
  final String comCategory;
  final String comDistrict;
  final String comImage;
  final int comNumPeople;
  final int comBadge;
  final int comLeaderId;
  final int comTotalMileage;
  final int isFavorite;
  final List<PhotoItem>? photoList;

  CommunityItem({
    required this.comId,
    required this.comName,
    required this.comContent,
    required this.comCategory,
    required this.comDistrict,
    required this.comImage,
    required this.comNumPeople,
    required this.comBadge,
    required this.comLeaderId,
    required this.comTotalMileage,
    required this.isFavorite,
    this.photoList,
  });

  factory CommunityItem.fromJson(Map<String, dynamic> json) {
    return CommunityItem(
      comId: json['com_id'],
      comName: json['com_name'],
      comContent: json['com_content'],
      comCategory: json['com_category'],
      comDistrict: json['com_district'],
      comImage: json['com_image'],
      comNumPeople: json['com_num_people'],
      comBadge: json['com_badge'],
      comLeaderId: json['com_leader_id'],
      comTotalMileage: json['com_total_Mileage'],
      isFavorite: json['is_favorite'],
      photoList: (json['photo_list'] as List<dynamic>?)
          ?.map((item) => PhotoItem.fromJson(item))
          .toList(),
    );
  }
}

class PhotoItem {
  final int feedId;
  final String userNick;
  final String schName;
  final String schStDate;
  final String shcEndDate;
  final String feedCreated;
  final String feedImage;
  final int feedLike;

  PhotoItem({
    required this.feedId,
    required this.userNick,
    required this.schName,
    required this.schStDate,
    required this.shcEndDate,
    required this.feedCreated,
    required this.feedImage,
    required this.feedLike,
  });

  factory PhotoItem.fromJson(Map<String, dynamic> json) {
    return PhotoItem(
      feedId: json['feed_id'],
      userNick: json['user_nick'],
      schName: json['sch_name'],
      schStDate: json['sch_st_date'],
      shcEndDate: json['shc_end_date'],
      feedCreated: json['feed_created'],
      feedImage: json['feed_image'],
      feedLike: json['feed_like'],
    );
  }
}
