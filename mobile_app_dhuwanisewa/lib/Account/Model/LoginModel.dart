class LoginModel {
  String userName;
  String password;
  LoginModel({required this.userName, required this.password});
}

class LoginResponseModel {
  String accessToken;
  String refreshToken;
  String userId;
  int appUserId;
  String userName;
  String fullName;
  LoginResponseModel(
      {required this.userId,
      required this.appUserId,
      required this.userName,
      required this.fullName,
      required this.accessToken,
      required this.refreshToken});

  factory LoginResponseModel.fromJson(Map<String, dynamic> data) {
    return LoginResponseModel(
        userId: data["userId"],
        appUserId: data["appUserId"],
        accessToken: data["accessToken"],
        refreshToken: data["refreshToken"],
        userName: data["userName"],
        fullName: data["fullName"]);
  }

}
