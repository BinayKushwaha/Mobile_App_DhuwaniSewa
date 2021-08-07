import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Account/Header.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/CustomWidget/CustomNotification.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/Model/ResponseModel.dart';
import 'package:mobile_app_dhuwanisewa/CustomValidator/CustomValidator.dart';
import 'package:mobile_app_dhuwanisewa/Enum/ResponseStatus.dart';
import 'package:mobile_app_dhuwanisewa/ServiceLocator/ServiceLocator.dart';

import 'Service/AccountService.dart';
import 'VerfiyAccount.dart';

class OtpResend extends StatefulWidget {
  @override
  OtpResendState createState() {
    return OtpResendState();
  }
}

class OtpResendState extends State<OtpResend> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Send OTP"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [appHeading(), ResendForm()],
        ),
      ),
    );
  }
}

class ResendForm extends StatefulWidget {
  @override
  ResendFormState createState() {
    return ResendFormState();
  }
}

class ResendFormState extends State<ResendForm> {
  TextEditingController _userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AccountService _accountService = getIt<AccountService>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    hintText: "Email or Mobile number"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email or Mobile number is required";
                  }
                  if (!CustomValidator.isEmail(value) &&
                      !CustomValidator.isMobileNumber(value))
                    return "Invalid Username format.";
                  return null;
                },
              ),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                child: Text(
                  "Send",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String userName = _userNameController.text;
                    ResponseModel response =
                        await _accountService.resendOtp(userName);
                    if (response.status ==
                        EnumToString.convertToString(ResponseStatus.Success)) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyAccount(
                                    userName: userName,
                                  )));
                    } else {
                      CustomNotification.showNotification(
                          context, response.message, response.status);
                    }
                  }
                },
              ),
            )
          ],
        ));
  }
}
