import 'dart:convert';

import 'package:graduationproject/api/api_constants.dart';
import 'package:graduationproject/model/request/RegisterRequest.dart';
import 'package:graduationproject/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

class ApiManger {
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
}
