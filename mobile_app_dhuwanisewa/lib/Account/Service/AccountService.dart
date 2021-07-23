import 'dart:convert';
import 'package:mobile_app_dhuwanisewa/Account/Model/AccountModel.dart';
import 'package:http/http.dart' as httpClient;
import 'package:mobile_app_dhuwanisewa/Commmon/ApiBaseEndPoint.dart';

class AccountService extends IAccountService {
  Future<UserRegistrationModel> save(UserRegistrationModel model) async {
    Map param = {
      "id": model.userId,
      "userName": model.userName,
      "password": model.password,
      "isCompnay": model.isCompnay,
      "isServiceProvider": model.isServiceProvider,
      "isEmployee":model.isEmployee,
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
      print('error: $error');
      print('stackTrace: $stackTrace');
      throw Exception("Failed to add user");
    });
    print(response.body);
    if (response.statusCode == 200) {
      return UserRegistrationModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to registter users.");
    }
  }

  Future<String> getHome() async {
    final httpClient.Response reponse = await httpClient
        .get(Uri.parse(ApiBaseEndPoint.baseUri + '/api/serviceprovider/list'))
        .onError((error, stackTrace) {
      print('error: $error');
      print('stackTrace: $stackTrace');
      throw Exception("Failed to get Home page");
    });
    var result = reponse.body.toString();
    print("get result:  " + result);
    return result;
  }
}

abstract class IAccountService {
  Future<UserRegistrationModel> save(UserRegistrationModel model);
  Future<String> getHome();
}
