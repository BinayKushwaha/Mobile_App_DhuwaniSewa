class LoginModel {
  String userName;
  String password;
  LoginModel({required this.userName, required this.password});
}

class LoginResponseModel {
  String accessToken;
  String refreshToken;
  String notifyType;
  String message;
  LoginResponseModel(
      {required this.notifyType,
      required this.message,
      required this.accessToken,
      required this.refreshToken});
}
