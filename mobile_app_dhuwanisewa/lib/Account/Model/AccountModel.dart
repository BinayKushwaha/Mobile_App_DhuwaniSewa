import 'package:flutter/cupertino.dart';
import 'dart:convert';

class UserRegistrationModel {
  int userId;
  String userName;
  String password;
  bool isCompnay;
  bool isEmployee;
  bool isServiceProvider;
  String firstName;
  String lastName;

  UserRegistrationModel(
      {this.userId = 0,
      required this.userName,
      required this.password,
      required this.isCompnay,
      required this.isEmployee,
      required this.isServiceProvider,
      required this.firstName,
      required this.lastName});

  factory UserRegistrationModel.fromJson(Map<String, dynamic> map) {
    return UserRegistrationModel(
        userId: map["Id"],
        userName: map["UserName"],
        password: map["Password"],
        isCompnay: map["IsCompany"],
        isEmployee: map["IsEmployee"],
        isServiceProvider: map["isServiceProvider"],
        firstName: map["firstName"],
        lastName: map["lastName"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "Id": userId,
      "UserName": userName,
      "Password": password,
      "IsCompnay": isCompnay,
      "IsServiceProvider": isServiceProvider,
      "FirstName": firstName,
      "LastName": lastName
    };
  }


}
