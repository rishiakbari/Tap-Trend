import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taptrend/models/login_model.dart';
import '../utils/api.dart';
import '../utils/helper.dart';


class ApiService {
  static final http.Client _client = http.Client();
  static final Map<String, String> _headers = {'Accept': 'application/json'};

  static Future<LoginModel> login({
    
    required String username,
    required String password,
  
  }) async {
    

    try {
      final response = await _client.post(
        Api.login,
        headers: _headers,
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 401) {
        Helper.logout();
        return LoginModel.fromJson(jsonDecode(''));
      }

      return LoginModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      return LoginModel.fromJson(
          jsonDecode('{"message":"Some technical issue! Please try again"}'));
    }
  }

  
}
