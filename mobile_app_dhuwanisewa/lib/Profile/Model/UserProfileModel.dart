class UserProfileModel {
  int userId;
  String fullName;
  String firstName;
  String lastName;
  String? email;
  bool emailConfirmed;
  String? mobileNumber;
  bool mobileNumberConfirmed;
  String? citizenshipNumber;

  UserProfileModel(
      {required this.userId,
      required this.fullName,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.emailConfirmed,
      required this.mobileNumber,
      required this.mobileNumberConfirmed,
      required this.citizenshipNumber});

  factory UserProfileModel.fromJson(Map<String, dynamic> data) {
    return UserProfileModel(
        userId: data["appUserId"],
        fullName: data["fullName"],
        firstName: data["firstName"],
        lastName: data["lastName"],
        email: data["email"],
        emailConfirmed: data["emailConfirmed"],
        mobileNumber: data["mobileNumber"],
        mobileNumberConfirmed: data["mobileNumberConfirmed"],
        citizenshipNumber: data["citizenshipNumber"]);
  }
}
