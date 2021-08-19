import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/CustomWidget/CustomNotification.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/Model/ResponseModel.dart';
import 'package:mobile_app_dhuwanisewa/Enum/ResponseStatus.dart';
import 'package:mobile_app_dhuwanisewa/ServiceLocator/ServiceLocator.dart';

import 'Header.dart';
import 'Model/PasswordResetModel.dart';
import 'Service/AccountService.dart';

class PasswordReset extends StatefulWidget {
  final String userName;
  PasswordReset({Key? key, required this.userName}) : super(key: key);

  @override
  PasswordResetState createState() {
    return PasswordResetState();
  }
}

class PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Verify your account",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          children: [appHeading(),PasswordResetForm(userName: widget.userName)],
        ),
      ),
    );
  }
}

class PasswordResetForm extends StatefulWidget {
  final String userName;
  PasswordResetForm({Key? key, required this.userName}) : super(key: key);

  @override
  PasswordResetFormState createState() {
    return PasswordResetFormState();
  }
}

class PasswordResetFormState extends State<PasswordResetForm> {
  final _formKey = GlobalKey<FormState>();
  AccountService _accountService = getIt<AccountService>();
  TextEditingController _otpController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Form(
        key: _formKey,
        child: Center(
            child: Card(
          margin: EdgeInsets.all(10),
          elevation: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: _otpController,
                  decoration: InputDecoration(labelText: "Your OTP"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "OTP required";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: _passWordController,
                  decoration: InputDecoration(
                      labelText: "Password", hintText: "Reset password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password required";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      PasswordResetModel param = new PasswordResetModel(
                          userName: widget.userName,
                          otp: _otpController.text,
                          password: _passWordController.text);

                      ResponseModel response =
                          await _accountService.verifyOtpResetPassword(param);
                      if (response.status ==
                          EnumToString.convertToString(
                              ResponseStatus.Success)) {
                        Navigator.pushNamed(context, '/');
                      }
                      CustomNotification.showNotification(
                          context, response.message, response.status);
                    }
                  },
                  child: Text(
                    'Verify',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  children: [
                    Text('Didn`t receive OTP ?'),
                    TextButton(
                        onPressed: () async {
                          final String userName = widget.userName;
                          ResponseModel response =
                              await _accountService.resendOtp(userName);
                          CustomNotification.showNotification(
                              context, response.message, response.status);
                        },
                        child: Text('Resend',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                            )))
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
