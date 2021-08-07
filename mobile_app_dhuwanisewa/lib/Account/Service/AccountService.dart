import 'dart:convert';
import 'package:mobile_app_dhuwanisewa/Account/Model/AccountModel.dart';
import 'package:http/http.dart' as httpClient;
import 'package:mobile_app_dhuwanisewa/Account/Model/LoginModel.dart';
import 'package:mobile_app_dhuwanisewa/Account/Model/OtpModel.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/ApiBaseEndPoint.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/Model/ResponseModel.dart';

class AccountServiceImplementation extends AccountService {
  @override
  Future<dynamic> save(UserRegistrationModel model) async {
    Map param = {
      "id": model.userId,
      "userName": model.userName,
      "password": model.password,
      "isCompnay": model.isCompnay,
      "isServiceProvider": model.isServiceProvider,
      "isEmployee": model.isEmployee,
      "firstName": model.firstName,
      "lastName": model.lastName
    };

    final httpClient.Response response = await httpClient
        .post(Uri.parse(ApiBaseEndPoint.baseUri + '/api/account/register/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(param))
        .onError((error, stackTrace) {
      throw Exception("Failed to add user");
    });
    final result = jsonDecode(response.body);
    return result;
  }

  Future<String> getHome() async {
    final httpClient.Response reponse = await httpClient
        .get(Uri.parse(ApiBaseEndPoint.baseUri + '/api/serviceprovider/list'))
        .onError((error, stackTrace) {
      throw Exception("Failed to get Home page");
    });
    var result = reponse.body.toString();
    print("get result:  " + result);
    return result;
  }

  @override
  Future<Map<String, dynamic>> login(LoginModel model) async {
    Map param = {"userName": model.userName, "password": model.password};
    httpClient.Response response = await httpClient.post(
        Uri.parse(ApiBaseEndPoint.baseUri + '/api/account/login/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(param));
    Map<String, dynamic> result = jsonDecode(response.body);
    return result;
  }

  @override
  Future<ResponseModel> verifyAccount(OtpModel model) async {
    Map param = {"userName": model.userName, "otp": model.otp};
    httpClient.Response response = await httpClient.post(
        Uri.parse(ApiBaseEndPoint.baseUri + '/api/account/verifyaccount/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(param));
    Map<String, dynamic> result = jsonDecode(response.body);
    return ResponseModel(
        status: result['status'],
        message: result['message'],
        data: result['data']);
  }

  @override
  Future<ResponseModel> resendOtp(String userName) async {
    Map param = {"userName": userName};
    httpClient.Response response = await httpClient.post(
        Uri.parse(ApiBaseEndPoint.baseUri + '/api/account/createotp/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(param));
    Map<String, dynamic> result = jsonDecode(response.body);
    return ResponseModel(
        status: result["status"],
        message: result["message"],
        data: result["data"]);
  }
}

abstract class AccountService {
  Future<dynamic> save(UserRegistrationModel model);
  Future<String> getHome();
  Future<Map<String, dynamic>> login(LoginModel model);
  Future<ResponseModel> verifyAccount(OtpModel model);
  Future<ResponseModel> resendOtp(String userName);
}
