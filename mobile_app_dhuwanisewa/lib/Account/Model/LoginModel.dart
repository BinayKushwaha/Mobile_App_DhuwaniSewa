class LoginModel {
  String userName;
  String password;
  LoginModel({required this.userName, required this.password});
}

class LoginResponseModel {
  String accessToken;
  String refreshToken;
  LoginResponseModel({required this.accessToken, required this.refreshToken});
}
