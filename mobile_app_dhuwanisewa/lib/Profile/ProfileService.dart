import 'dart:convert';
import 'package:http/http.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/ApiBaseEndPoint.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/CustomHttpClient/CustomHttpClient.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/Model/ResponseModel.dart';

abstract class ProfileService {
  Future<dynamic> getProfile(int userId);
}

class ProfileServiceImplementation extends ProfileService {
  @override
  Future<dynamic> getProfile(int userId) async {
    var http =  new CustomHttpClient();
    Map<String,String> header={'test':'test'};
    Response response = await http.get(Uri.parse(
        ApiBaseEndPoint.baseUri + '/api/user/userprofile?userId=${userId}'),headers: header);
    if (response.statusCode == 200)
      return jsonDecode(response.body);
    else
      throw Exception("Failed to load user profile");
  }
}
