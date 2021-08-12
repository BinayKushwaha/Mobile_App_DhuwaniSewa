import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Account/Model/OtpModel.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/CustomWidget/CustomNotification.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/Model/ResponseModel.dart';
import 'package:mobile_app_dhuwanisewa/Enum/ResponseStatus.dart';
import 'package:mobile_app_dhuwanisewa/ServiceLocator/ServiceLocator.dart';
import 'Service/AccountService.dart';

class AccountVerficationForm extends StatefulWidget {
  final String userName;
  AccountVerficationForm({Key? key, required this.userName}) : super(key: key);
  @override
  AccountVerficationFormState createState() {
    return AccountVerficationFormState();
  }
}

class AccountVerficationFormState extends State<AccountVerficationForm> {
  final _formKey = GlobalKey<FormState>();
  AccountService _accountService = getIt<AccountService>();

  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: _otpController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Your OTP"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "OTP required";
                }
                return null;
              },
            ),
          ),
          Container(
            height: 80,
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  OtpModel param=new OtpModel(userName:widget.userName, otp: _otpController.text);

                  ResponseModel response=await _accountService.verifyAccount(param);
                  if(response.status==EnumToString.convertToString(ResponseStatus.Success)){
                    Navigator.pushNamed(context, '/');
                  }
                  CustomNotification.showNotification(context, response.message, response.status);
                }
              },
              child: Text(
                'Verify',
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
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
                      ResponseModel response=await _accountService.resendOtp(userName);
                      CustomNotification.showNotification(context, response.message, response.status);
                    },
                    child: Text(
                      'Resend',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
