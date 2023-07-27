class BaseModel {
  final int code;
  final String message;

  BaseModel({required this.code, required this.message});

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel(
      code: json['code'],
      message: json['message'],
    );
  }
}
