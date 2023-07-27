import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:onemilegreen_front/models/green_seoul_status_model.dart';

class ApiService {
  static final baseUrl = dotenv.get("MOCK_SERVER_ADDRESS");

  static const String greenSeoul = "greenseoul";
  static const String status = "status";

  static Future<GreenSeoulStatusModel> getGreenSeoulStatus(
      {required String userNo}) async {
    final url = Uri.parse("$baseUrl/$greenSeoul/$status");

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userNo': userNo,
      }),
    );

    if (response.statusCode == 200) {
      final dynamic res = jsonDecode(response.body);
      print(res["data"]);

      return GreenSeoulStatusModel.fromJson(res);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
