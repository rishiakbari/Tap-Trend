import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taptrend/models/login_model.dart';
import '../models/profile_model.dart';
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

  static Future<ProfileModel> profile({
    
    required String token,
    // required String password,

  
  }) async {
    

    try {
           _headers.addAll({'Authorization': 'Bearer $token'});
      final response = await _client.get(
        Api.authProfile,
        headers: _headers,
      );
     

      if (response.statusCode == 401) {
        Helper.logout();
        return ProfileModel.fromJson(jsonDecode(''));
      }

      // print(response.body);
      return ProfileModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      return ProfileModel.fromJson(
          jsonDecode('{"message":"Some technical issue! Please try again"}'));
    }
  }

  // Update Profile
  static Future<ProfileModel> updateProfile({
    
    required String token,
    required String name,
    required String phone,
    required String email,

    // required String avatar,
  }) async {
    

    try {
           _headers.addAll({'Authorization': 'Bearer $token'});
           http.MultipartRequest request =
           http.MultipartRequest('POST', Api.authProfile);
           request.headers.addAll(_headers);
           request.fields.addAll({
           '_method': 'PATCH',
           'name': name,
           'country_code': '91',
           'phone': phone,
           'email': email,
        // 'distributor_code': distributorCode,
      });
      http.Response response =
          await http.Response.fromStream(await request.send());
      if (response.statusCode == 401) {
        Helper.logout();
        return ProfileModel.fromJson(jsonDecode(''));
      }
      ProfileModel profile = ProfileModel.fromJson(jsonDecode(response.body));
      profile.statusCode = response.statusCode;
      return profile;
   
    } catch (e) {
      return ProfileModel.fromJson(
          jsonDecode('{"message":"Some technical issue! Please try again"}'));
    }
  }

  
}
