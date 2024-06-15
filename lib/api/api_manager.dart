import 'dart:convert';
import 'dart:io';

import 'package:graduationproject/api/api_constants.dart';
import 'package:graduationproject/model/request/ChangePasswordRequest.dart';
import 'package:graduationproject/model/request/CheckOTPRequest.dart';
import 'package:graduationproject/model/request/ForgetPasswordRequest.dart';
import 'package:graduationproject/model/request/LoginRequest.dart';
import 'package:graduationproject/model/request/RegisterRequest.dart';
import 'package:graduationproject/model/response/ChangePasswordResponse.dart';
import 'package:graduationproject/model/response/CheckOTPResponse.dart';
import 'package:graduationproject/model/response/LoginResponse.dart';
import 'package:graduationproject/model/response/RegisterResponse.dart';
import 'package:graduationproject/model/response/forgetPasswordResponse.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../model/response/CreateCaseResponse.dart';
import '../model/response/LoggedUserInfo.dart';
import '../model/response/Missing.dart';

class ApiManager {
  /*
  https://dallatey.onrender.com/user/signup
   */
  static Future<RegisterResponse> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phone,
      String governorate) async {
    var registerBody = RegisterRequest(
      fullName: name,
      email: email,
      password: password,
      confirmPassword: rePassword,
      mobileNumber: phone,
      governorate: governorate,
    );
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
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
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginApi);
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
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.otpApi);
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(forgetPasswordBody.toJson()),
    );
    return ForgetPasswordResponse.fromJson(jsonDecode(response.body));
  }

  static Future<CheckOtpResponse> checkOTP(String email, String code) async {
    var checkOTPBody = CheckOtpRequest(
      identification: email,
      code: code,
    );
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.checkOTPApi);
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(checkOTPBody.toJson()),
    );
    return CheckOtpResponse.fromJson(jsonDecode(response.body));
  }

  static Future<ChangePasswordResponse> changePassword(String email,String code,
       String newPassWord, String confirmNewPassword) async {
    var checkOTPBody = ChangePasswordRequest(
        identification: email,
        code: code,
        newPassword: newPassWord,
        confirmNewPassword: confirmNewPassword);
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.changePasswordApi);
    var response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(checkOTPBody.toJson()),
    );
    return ChangePasswordResponse.fromJson(jsonDecode(response.body));
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

// static Future<CreateCaseResponse> CreateCase(
  //     String name,
  //     String gender,
  //     int age,
  //     String mobileNumber,
  //     String city,
  //     String locationOfLoss,
  //     String dateOfLoss,
  //     String description,
  //     List<File> images,
  //     String status) async {
  //   var CreateCaseBodyBody = CreateCaseRequest(
  //     name: name,
  //     gender: gender,
  //     age: age,
  //     city: city,
  //     locationOfLoss: locationOfLoss,
  //     dateOfLoss: dateOfLoss,
  //     description: description,
  //     images: images,
  //     status: status,
  //   );
  //   Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.allMissingApi);
  //   var response = await http.post(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode(CreateCaseBodyBody.toJson()),
  //   );
  //   return CreateCaseResponse.fromJson(jsonDecode(response.body));
  // }
  static Future<CreateCaseResponse> CreateCase(
      String name,
      String gender,
      int age,
      String mobileNumber,
      String city,
      String locationOfLoss,
      String dateOfLoss,
      String description,
      List<File> images, // Change to List<File>
      String status
      ) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.allMissingApi);

    var request = http.MultipartRequest('POST', url,)
      ..fields['name'] = name
      ..fields['gender'] = gender
      ..fields['age'] = age.toString()
      ..fields['mobileNumber'] = mobileNumber
      ..fields['city'] = city
      ..fields['locationOfLoss'] = locationOfLoss
      ..fields['dateOfLoss'] = dateOfLoss
      ..fields['description'] = description
      ..fields['status'] = status;

    // Add the images as MultipartFile(s)
    for (var image in images) {
      request.files.add(await http.MultipartFile.fromPath(
        'images', // Field name for the image in the API
        image.path,
        contentType: MediaType('image', 'jpg'), // Adjust the content type if necessary
      ));
    }

    // Send the request and get the response
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 201) {
      // Parse and return the response
      return CreateCaseResponse.fromJson(jsonDecode(response.body));
    } else {
      // Handle the error
      throw Exception('Failed to create case: ${response.reasonPhrase}');
    }
  }

  static Future<LoggedUserInfo> getLoggedUserInfo(String token) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.userApi);
    try {
      var response = await http.get(
        url,
        headers: {
          'token':
          token,
        },
      );
      var json = jsonDecode(response.body);
      return LoggedUserInfo.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<Missing> getUserPosts() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.userPostsApi);
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
