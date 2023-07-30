class GetUserAuth {
  final int code;
  final String message;
  final Data data;

  GetUserAuth({
    required this.code,
    required this.message,
    required this.data,
  });

  factory GetUserAuth.fromJson(Map<String, dynamic> json) {
    return GetUserAuth(
      code: json['code'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final List<RoutineDetails> routineDetails;

  Data({required this.routineDetails});

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['routineDetails'] as List;
    List<RoutineDetails> routineDetailsList =
        list.map((i) => RoutineDetails.fromJson(i)).toList();
    return Data(
      routineDetails: routineDetailsList,
    );
  }
}

class RoutineDetails {
  final String userNick;
  final String urdImage;
  int urdLike;

  RoutineDetails({
    required this.userNick,
    required this.urdImage,
    required this.urdLike,
  });

  factory RoutineDetails.fromJson(Map<String, dynamic> json) {
    return RoutineDetails(
      userNick: json['user_nick'],
      urdImage: json['urd_image'],
      urdLike: json['urd_like'],
    );
  }
}
