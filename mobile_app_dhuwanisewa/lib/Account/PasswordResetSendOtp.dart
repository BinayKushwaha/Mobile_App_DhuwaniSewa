import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/CustomWidget/CustomNotification.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/Model/ResponseModel.dart';
import 'package:mobile_app_dhuwanisewa/CustomValidator/CustomValidator.dart';
import 'package:mobile_app_dhuwanisewa/Enum/ResponseStatus.dart';
import 'package:mobile_app_dhuwanisewa/ServiceLocator/ServiceLocator.dart';
import 'Header.dart';
import 'PasswordReset.dart';
import 'Service/AccountService.dart';

class PasswordResetOtpSend extends StatefulWidget {
  @override
  PasswordResetOtpSendState createState() {
    return PasswordResetOtpSendState();
  }
}

class PasswordResetOtpSendState extends State<PasswordResetOtpSend> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
          "Send OTP",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          children: [appHeading(), PasswordOtpResendForm()],
        ),
      ),
    );
  }
}

class PasswordOtpResendForm extends StatefulWidget {
  @override
  PasswordOtpResendFormState createState() {
    return PasswordOtpResendFormState();
  }
}

class PasswordOtpResendFormState extends State<PasswordOtpResendForm> {
  TextEditingController _emailMobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AccountService _accountService = getIt<AccountService>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Center(
          child: Card(
            elevation: 15,
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _emailMobileController,
                    decoration: InputDecoration(
                        labelText: "Email or Mobile",
                        hintText: "Email or Mobile"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email or Mobile number is required";
                      }
                      if (!CustomValidator.isEmail(value) &&
                          !CustomValidator.isMobileNumber(value))
                        return "Invalid Email or Mobile format.";
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    child: Text(
                      "Send",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String emailMobile = _emailMobileController.text;
                        ResponseModel response =
                            await _accountService.passwordResetSendOtp(emailMobile);
                        String userName=response.data.toString();
                        if (response.status ==
                            EnumToString.convertToString(
                                ResponseStatus.Success)) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PasswordReset(
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
            ),
          ),
        ));
  }
}
