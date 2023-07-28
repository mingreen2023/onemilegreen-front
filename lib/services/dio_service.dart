import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:onemilegreen_front/models/green_seoul_status_model.dart';
import 'package:onemilegreen_front/models/routine_status_model.dart';

var logger = Logger();

class DioServices {
  static final DioServices _dioServices = DioServices._internal();
  factory DioServices() => _dioServices;
  Map<String, dynamic> dioInformation = {};
  static final baseUrl = dotenv.get("MOCK_SERVER_ADDRESS");

  static const String greenSeoul = "greenseoul";
  static const String status = "status";

  /// routine/userRoutine/status
  static const String routine = "routine";
  static const String userRoutine = "userRoutine";

  static Dio _dio = Dio();

  DioServices._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      sendTimeout: const Duration(milliseconds: 10000),
      // headers: {},
    );
    _dio = Dio(options);
    _dio.interceptors.add(DioInterceptor());
  }

  Dio to() {
    return _dio;
  }

  static Future<GreenSeoulStatusModel> getGreenSeoulStatus(
      {required String userNo}) async {
    final url = "$baseUrl/$greenSeoul/$status";
    try {
      Map<String, dynamic> data = {
        "userNo": userNo,
      };
      final response = await _dio.post(url, data: data);

      logger.d(response.data);

      if (response.data["code"] == 200) {
        return GreenSeoulStatusModel.fromJson(response.data);
      } else {
        return response.data["message"];
      }
    } on DioException catch (e) {
      if (e.response != null) {
        logger.e(e.response?.data);
        logger.e(e.response?.headers);
        logger.e(e.response?.requestOptions);
      } else {
        logger.e(e.requestOptions);
        logger.e(e.message);
      }

      return e.response!.data;
    }
  }

  static Future<RoutineStatusModel> getUserRoutineStatus(
      {required String userNo}) async {
    final url = "$baseUrl/$routine/$userRoutine/$status";
    try {
      Map<String, dynamic> data = {
        "userNo": userNo,
      };
      final response = await _dio.post(url, data: data);
      if (response.data["code"] == 200) {
        logger.d(response.data);

        return RoutineStatusModel.fromJson(response.data);
      } else {
        return response.data["message"];
      }
    } on DioException catch (e) {
      if (e.response != null) {
        logger.e(e.response?.data);
        logger.e(e.response?.headers);
        logger.e(e.response?.requestOptions);
      } else {
        logger.e(e.requestOptions);
        logger.e(e.message);
      }

      return e.response?.data;
    }
  }

  static Future<RoutineStatusModel> getRoutineList(
      {required String userNo}) async {
    final url = "$baseUrl/$routine/$userRoutine/$status";
    try {
      Map<String, dynamic> data = {
        "userNo": userNo,
      };

      final response = await _dio.post(url, data: data);
      if (response.data["code"] == 200) {
        logger.d(response.data);

        return RoutineStatusModel.fromJson(response.data);
      } else {
        return response.data["message"];
      }
    } on DioException catch (e) {
      if (e.response != null) {
        logger.e(e.response?.data);
        logger.e(e.response?.headers);
        logger.e(e.response?.requestOptions);
      } else {
        logger.e(e.requestOptions);
        logger.e(e.message);
      }

      return e.response?.data;
    }
  }
}

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.e("BaseUrl ${options.baseUrl}");
    logger.e("Path ${options.path}");
    logger.e("Parameters ${options.queryParameters}");
    logger.e("Data ${options.data}");
    logger.e("Connect Timeout ${options.connectTimeout}");
    logger.e("Send Timeout ${options.sendTimeout}");
    logger.e("Receive Timeout ${options.receiveTimeout}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.e(response.statusCode);
    logger.e(response.data);
    logger.e("BaseUrl ${response.requestOptions.baseUrl}");
    logger.e("Path ${response.requestOptions.path}");
    logger.e("Parameters ${response.requestOptions.queryParameters}");
    logger.e("Data ${response.requestOptions.data}");
    logger.e("Connect Timeout ${response.requestOptions.connectTimeout}");
    logger.e("Send Timeout ${response.requestOptions.sendTimeout}");
    logger.e("Receive Timeout ${response.requestOptions.receiveTimeout}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    logger.e("Error ${err.error}");
    logger.e("Error Message ${err.message}");
    super.onError(err, handler);
  }
}