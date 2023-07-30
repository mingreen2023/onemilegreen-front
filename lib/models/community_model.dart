import 'package:onemilegreen_front/models/base_model.dart';

class CommunityListResponse extends BaseModel {
  CommunityListResponse({
    required int code,
    required String message,
    required this.data,
  }) : super(code: code, message: message);

  Data data;

  factory CommunityListResponse.fromJson(Map<String, dynamic> json) =>
      CommunityListResponse(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.communityList,
  });

  List<CommunityList> communityList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        communityList: List<CommunityList>.from(
            json["communityList"].map((x) => CommunityList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "communityList":
            List<dynamic>.from(communityList.map((x) => x.toJson())),
      };
}

class CommunityList {
  CommunityList({
    required this.comId,
    required this.comName,
    required this.comContent,
    required this.comCategory,
    required this.comDistrict,
    required this.comImage,
    required this.comNumPeople,
    required this.comBadge,
    required this.comLeaderId,
  });

  int comId;
  String comName;
  String comContent;
  String comCategory;
  String comDistrict;
  String comImage;
  int comNumPeople;
  int comBadge;
  int comLeaderId;

  factory CommunityList.fromJson(Map<String, dynamic> json) => CommunityList(
        comId: json["com_id"],
        comName: json["com_name"],
        comContent: json["com_content"],
        comCategory: json["com_category"],
        comDistrict: json["com_district"],
        comImage: json["com_image"],
        comNumPeople: json["com_num_people"],
        comBadge: json["com_badge"],
        comLeaderId: json["com_leader_id"],
      );

  Map<String, dynamic> toJson() => {
        "com_id": comId,
        "com_name": comName,
        "com_content": comContent,
        "com_category": comCategory,
        "com_district": comDistrict,
        "com_image": comImage,
        "com_num_people": comNumPeople,
        "com_badge": comBadge,
        "com_leader_id": comLeaderId,
      };
}
