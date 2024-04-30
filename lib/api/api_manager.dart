import 'dart:convert';

import 'package:graduationproject/api/api_constants.dart';
import 'package:graduationproject/model/request/ForgetPasswordRequest.dart';
import 'package:graduationproject/model/request/LoginRequest.dart';
import 'package:graduationproject/model/request/RegisterRequest.dart';
import 'package:graduationproject/model/response/LoginResponse.dart';
import 'package:graduationproject/model/response/RegisterResponse.dart';
import 'package:graduationproject/model/response/forgetPasswordResponse.dart';
import 'package:http/http.dart' as http;

import '../model/response/Missing.dart';

class ApiManager {
  /*
  https://dallatey.onrender.com/user/signup
   */
  static Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone, String governorate) async {
    var registerBody = RegisterRequest(
      fullName: name,
      email: email,
      password: password,
      confirmPassword: rePassword,
      mobileNumber: phone,
      governorate: governorate,
    );
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.registerApi);
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(registerBody.toJson()),
    );
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }

  static Future<LoginResponse> login(String email, String password) async {
    var loginBody = LoginRequest(
      email: email,
      password: password,
    );
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.loginApi);
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(loginBody.toJson()),
    );
    return LoginResponse.fromJson(jsonDecode(response.body));
  }

  static Future<ForgetPasswordResponse> forgetPassword(String email) async {
    var forgetPasswordBody = ForgetPasswordRequest(
      identification: email,
    );
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.otpApi);
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(forgetPasswordBody.toJson()),
    );
    return ForgetPasswordResponse.fromJson(jsonDecode(response.body));
  }

  static Future<Missing> getAllMissing() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.allMissingApi);
    try {
      var response = await http.get(
        url,
        headers: {
          'token':
          'secret_eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MzBmZGRiOTY4ODc1ZTgzOWQ2YzZkMSIsImVtYWlsIjoiemlhZGVzc2FtMTExQGdtYWlsLmNvbSIsImlhdCI6MTcxNDQ4Njc2Nn0.umyk8Nz8Rx30OAxkmMUZtUacBIyt7Nut5wwDiMjgh54',
        },
      );

      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return Missing.fromJson(json);
    } catch (e) {
      throw e;
    }
  }


}
