import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Account/Header.dart';
import 'package:mobile_app_dhuwanisewa/Account/Model/LoginModel.dart';
import 'package:mobile_app_dhuwanisewa/Account/Service/AccountService.dart';
import 'package:mobile_app_dhuwanisewa/Account/ServiceProviderRegistration.dart';
import 'package:mobile_app_dhuwanisewa/Account/ServiceSeekerRegistration.dart';
import 'package:mobile_app_dhuwanisewa/AppNavigation/AppNavigation.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/CustomWidget/CustomNotification.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/Model/ResponseModel.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/SharedRefrence/SharedRefrence.dart';
import 'package:mobile_app_dhuwanisewa/Constant/Account/AccountResponseMessage.dart';
import 'package:mobile_app_dhuwanisewa/Constant/Common/CacheKey.dart';
import 'package:mobile_app_dhuwanisewa/CustomValidator/CustomValidator.dart';
import 'package:mobile_app_dhuwanisewa/Enum/ResponseStatus.dart';
import 'package:mobile_app_dhuwanisewa/ServiceLocator/ServiceLocator.dart';
import 'OtpResendForm.dart';
import 'PasswordResetSendOtp.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: ListView(
        children: [
          appHeading(),
          LoginForm(),
        ],
      ),
    ));
  }
}

class UserRegistrationTypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: ListView(
          children: [
            appHeading(),
            Container(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Card(
                elevation: 15,
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 50,
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        child: Text(
                          'Service Provider',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ServiceProviderRegistration()));
                        },
                      ),
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        child: Text(
                          'Service Seeker',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ServiceSeekerRegistration()));
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text('Already have an account ?'),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              ))
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  bool _passwordHidden = true;
  bool _veifyAccount = false;
  bool _changePassword = false;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AccountService _accountService = getIt<AccountService>();
  SharedReference _sharedReference = getIt<SharedReference>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Card(
            margin: EdgeInsets.all(10),
            elevation: 15,
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: userNameController,
                        decoration: InputDecoration(
                            labelText: 'Username',
                            hintText: 'Email or Mobile number'),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Username is required.';
                          if (!CustomValidator.isEmail(value) &&
                              !CustomValidator.isMobileNumber(value))
                            return "Invalid Username format.";
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: _passwordHidden,
                        controller: passwordController,
                        decoration: InputDecoration(
                            focusColor: Colors.red,
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(_passwordHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _passwordHidden = !_passwordHidden;
                                });
                              },
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Password is required.';
                          return null;
                        },
                      ),
                    ),
                    if (_changePassword)
                      Container(
                        padding: EdgeInsets.fromLTRB(50, 0, 40, 0),
                        child: Row(
                          children: [
                            Text('Forget Password ?'),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PasswordResetOtpSend()));
                              },
                              child: Text('Reset',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      color: Colors.red)),
                            ),
                          ],
                        ),
                      ),
                    if (_veifyAccount)
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OtpResend()));
                          },
                          child: Text(
                            'Verify your account',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: Colors.red),
                          )),
                    Container(
                      height: 50,
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final LoginModel reuestParam = new LoginModel(
                                userName: userNameController.text,
                                password: passwordController.text);

                            ResponseModel result =
                                await _accountService.login(reuestParam);
                            String message = result.message;
                            String notifyType = result.status;
                            dynamic data = result.data;
                            setState(() {
                              if (notifyType ==
                                      EnumToString.convertToString(
                                          ResponseStatus.Info) &&
                                  message ==
                                      AccountResponseMessage
                                          .unverified_account_message) {
                                _veifyAccount = true;
                              } else {
                                _veifyAccount = false;
                              }

                              if (notifyType ==
                                      EnumToString.convertToString(
                                          ResponseStatus.Info) &&
                                  message ==
                                      AccountResponseMessage
                                          .forget_password_message) {
                                _changePassword = true;
                              } else {
                                _changePassword = false;
                              }
                            });
                            if (notifyType ==
                                    EnumToString.convertToString(
                                        ResponseStatus.Success) &&
                                data != null) {

                              //Set user data in cache
                              _sharedReference.setJsonData(
                                  data, Shared_CacheKey.loginCredentials);

                              LoginResponseModel userData =
                                  LoginResponseModel.fromJson(data);

                              //Set userId in cache
                              _sharedReference.setInt(Shared_CacheKey.appUserId,
                                  userData.appUserId);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AppNavigation()));
                            }
                            CustomNotification.showNotification(
                                context, message, notifyType);
                          }
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text('Does not have account ?'),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/Registration');
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.red),
                              ))
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    )
                  ],
                ))));
  }
}
