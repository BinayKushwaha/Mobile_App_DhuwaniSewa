import 'package:http/http.dart' as http;
import 'package:mobile_app_dhuwanisewa/Account/Model/LoginModel.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/SharedRefrence/SharedRefrence.dart';
import 'package:mobile_app_dhuwanisewa/Constant/Common/CacheKey.dart';
import 'package:mobile_app_dhuwanisewa/ServiceLocator/ServiceLocator.dart';

class CustomHttpClient extends http.BaseClient {
  CustomHttpClient();
  final http.Client _client = new http.Client();
  SharedReference _sharedPref = getIt<SharedReference>();
  String _inMemoryToken = '';

  Map<String, String> requestHeader = {};

  String get userAcessToken {
    if (_inMemoryToken.isNotEmpty) return _inMemoryToken;
    _loadTokenFromSharedPreference().then((value) {
      _inMemoryToken = value;
    });
    return _inMemoryToken;
  }

  Future<String> _loadTokenFromSharedPreference() async {
    String accessToken = '';
    dynamic userData =
        await _sharedPref.getJsonData(Shared_CacheKey.loginCredentials);
    LoginResponseModel response = LoginResponseModel.fromJson(userData);
    accessToken = response.accessToken;
    return accessToken;
  }

  void setHeaders() {
    if (requestHeader.isEmpty) {
      if (userAcessToken.isNotEmpty)
        requestHeader = {
          'Authorization': 'Bearer ' + userAcessToken,
          'Content-Type': 'application/json; charset=UTF-8'
        };
      else
        requestHeader = {'Content-Type': 'application/json; charset=UTF-8'};
    }
  }

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    this.setHeaders();
    return this._client.get(url, headers: requestHeader);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(requestHeader);
    return _client.send(request);
  }

  // Don't forget to reset the cache when logging out the user
  void reset() {
    _inMemoryToken = '';
  }
}
