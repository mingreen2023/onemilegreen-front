import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:onemilegreen_front/models/community_detail_model.dart';
import 'package:onemilegreen_front/models/community_model.dart';
import 'package:onemilegreen_front/models/community_schedule_model.dart';
import 'package:onemilegreen_front/models/green_seoul_status_model.dart';
import 'package:onemilegreen_front/models/routine_join_result.dart';
import 'package:onemilegreen_front/models/routine_list_model.dart';
import 'package:onemilegreen_front/models/routine_single_model.dart';
import 'package:onemilegreen_front/models/routine_status_model.dart';
import 'package:onemilegreen_front/models/routnine_get_userauth_model.dart';

var logger = Logger();

class DioServices {
  static final DioServices _dioServices = DioServices._internal();
  factory DioServices() => _dioServices;
  Map<String, dynamic> dioInformation = {};
  static final mockServer = dotenv.get("MOCK_SERVER_ADDRESS");
  static final server = dotenv.get("SERVER_ADDRESS");

  static const String greenSeoul = "greenseoul";
  static const String status = "status";

  ///routine
  static const String routine = "routine";
  static const String userRoutine = "userRoutine";
  static const String routineList = "routineList";
  static const String routineItem = "routineItem";
  static const String joinRoutine = "joinRoutine";
  static const String findAllUserRoutine = "findAllUserRoutine";
  static const String routineUploadFile = "routineUploadFile";

  //community
  static const String community = "community";
  static const String communityList = "communityList";
  static const String myCommunityList = "myCommunityList";
  static const String communityItem = "communityItem";
  static const String getAllSchedule = "getAllSchedule";

  static Dio _dio = Dio();

  DioServices._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: mockServer,
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      sendTimeout: const Duration(milliseconds: 10000),
      //headers: {},
    );
    _dio = Dio(options);
    _dio.interceptors.add(DioInterceptor());
  }

  Dio to() {
    return _dio;
  }

  static Future<T> _performPost<T>({
    required String url,
    required Map<String, dynamic> data,
    required T Function(Map<String, dynamic>) fromJson,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(url, data: data, options: options);
      if (response.data["code"] == 200) {
        logger.d(response.data);
        return fromJson(response.data);
      } else {
        throw Exception(response.data["message"]);
      }
    } catch (e) {
      if (e is DioException) {
        logger.e(url);

        if (e.response != null) {
          logger.e(e.response?.data);
          logger.e(e.response?.headers);
          logger.e(e.response?.requestOptions);
        } else {
          logger.e(e.requestOptions);
          logger.e(e.message);
        }
      }
      logger.e(url);
      throw Exception(e);
      //TODO: return empty list or custom error
    }
  }

//greenSeoul/status
  static Future<GreenSeoulStatusModel> getGreenSeoulStatus(
          {required String userNo}) =>
      _performPost(
        url: "$mockServer/$greenSeoul/$status",
        data: {
          "userNo": userNo,
        },
        fromJson: (data) => GreenSeoulStatusModel.fromJson(data),
      );

//routine/userRoutine/status
  static Future<RoutineStatusModel> getUserRoutineStatus(
          {required String userNo}) =>
      _performPost(
        url: "$mockServer/$routine/$userRoutine/$status",
        data: {
          "userNo": userNo,
        },
        fromJson: (data) => RoutineStatusModel.fromJson(data),
      );

//routine/routineList
  static Future<RoutineListModel> getRoutineList({required String userNo}) =>
      _performPost(
        url: "$mockServer/$routine/$routineList",
        data: {
          "userNo": userNo,
        },
        fromJson: (data) => RoutineListModel.fromJson(data),
      );

//routine/routineItem
  static Future<SingleRoutineModel> getRoutineItem({
    required String userNo,
    required int rouId,
  }) =>
      _performPost(
        url: "$mockServer/$routine/$routineItem",
        data: {
          "user_no": userNo,
          "rou_id": rouId,
        },
        fromJson: (data) => SingleRoutineModel.fromJson(data),
      );

//routine/joinRoutine
  static Future<RoutineJoinResultModel> insertRoutine({
    required String userNo,
    required int rouId,
  }) =>
      _performPost(
        url: "$mockServer/$routine/$joinRoutine",
        data: {
          "user_no": userNo,
          "routine_id": rouId,
        },
        fromJson: (data) => RoutineJoinResultModel.fromJson(data),
      );

//routine/findAllUserRoutine
  static Future<GetUserAuth> getAllUserRoutine({required int rouId}) async =>
      _performPost(
        url: "$mockServer/$routine/$findAllUserRoutine",
        data: {
          "rou_id": rouId,
        },
        fromJson: (data) => GetUserAuth.fromJson(data),
      );

//routine/routineUploadFile
  static Future<String> insertRoutineFile(FormData formData) async {
    try {
      final response = await _dio.post(
        "$server/$routine/$routineUploadFile",
        data: formData,
      );
      logger.d(response.data);
      return response.data;

      // if (response.data["code"] == 200) {
      // } else {
      //   //throw Exception(response.data["message"]);
      //   return RoutineAuthResult(code: 404, message: "error", result: "");
      // }
    } catch (e) {
      logger.e(e.toString());
      //throw Exception(e);
      return e.toString();

      //return RoutineAuthResult(code: 404, message: "error", result: "");
    }
  }

//community/communityList
  static Future<CommunityListResponse> getCommunityList({
    required int userNo,
    required category,
  }) async =>
      _performPost(
        url: "$mockServer/$community/$communityList",
        data: {
          "userNo": userNo,
          "category": category,
        },
        fromJson: (data) => CommunityListResponse.fromJson(data),
      );

//community/myCommunityList
  static Future<CommunityListResponse> getMyCommunityList({
    required int userNo,
    required category,
  }) async =>
      _performPost(
        url: "$mockServer/$community/my/communityList",
        data: {
          "userNo": userNo,
          "category": category,
        },
        fromJson: (data) => CommunityListResponse.fromJson(data),
      );

//community/communityItem
  static Future<CommunityItemResponse> getCoummunityDetail({
    required int userNo,
    required int com_id,
  }) async =>
      _performPost(
        url: "$mockServer/$community/$communityItem",
        data: {
          "userNo": userNo,
          "com_id": com_id,
        },
        fromJson: (data) => CommunityItemResponse.fromJson(data),
      );

//community/getAllSchedule
  static Future<ScheduleData> getCommunityAllSchedule({
    required int comId,
  }) async =>
      _performPost(
        url: "$mockServer/$community/$getAllSchedule",
        data: {
          "com_id": comId,
        },
        fromJson: (data) => ScheduleData.fromJson(data),
      );
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
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.e("Error ${err.error}");
    logger.e("Error Message ${err.message}");
    super.onError(err, handler);
  }
}
