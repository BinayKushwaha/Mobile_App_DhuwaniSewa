import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Account/Model/AccountModel.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/CustomWidget/CustomNotification.dart';
import 'package:mobile_app_dhuwanisewa/CustomValidator/CustomValidator.dart';
import 'package:mobile_app_dhuwanisewa/Enum/UserType.dart';
import 'package:mobile_app_dhuwanisewa/Account/Service/AccountService.dart';
import 'package:mobile_app_dhuwanisewa/ServiceLocator/ServiceLocator.dart';
import 'package:mobile_app_dhuwanisewa/Enum/ResponseStatus.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'VerfiyAccount.dart';

class RegistrationForm extends StatefulWidget {
  final UserType userType;
  RegistrationForm({Key? key, required this.userType}) : super(key: key);
  @override
  RegistrationFormState createState() {
    return RegistrationFormState(userType: userType);
  }
}

class RegistrationFormState extends State<RegistrationForm> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  UserType userType;
  bool _passwordHiden = true;
  bool _isServiceProvider = true;
  AccountService _accountService = getIt<AccountService>();

  RegistrationFormState({required this.userType});
  final _formKey = GlobalKey<FormState>();

  void _registrationConfirmationDialog(UserRegistrationModel reuestParam) {
    showDialog(
        context: context,
        builder: (BuildContext contextBuilder) {
          return AlertDialog(
            title: Text("Account verification"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('We will send you Otp code at ${reuestParam.userName}.')
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Edit")),
              TextButton(
                  onPressed: () async {
                    dynamic result = await _accountService.save(reuestParam);
                    String message = result["message"];
                    String status = result["status"];
                    if (status ==
                        EnumToString.convertToString(ResponseStatus.Success)) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyAccount(
                                  userName: reuestParam.userName)));
                    } else {
                      CustomNotification.showNotification(
                          context, message, status);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Ok"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(10),
          elevation: 15,
          child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                ),
                onChanged: (input) {
                  if (input.length > 0) {}
                },
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'First Name required.';
                  return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Last Name required.';
                  return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Email or Mobile number'),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Username is Requied';
                  if (!CustomValidator.isMobileNumber(value) &&
                      !CustomValidator.isEmail(value))
                    return 'Invalid Username format.';
                  return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                obscureText: _passwordHiden,
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(_passwordHiden
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _passwordHiden = !_passwordHiden;
                        });
                      },
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Password is required';
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
                  'Submit',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (userType == UserType.ServiceProvider)
                      _isServiceProvider = true;
                    else if (userType == UserType.ServiceSeeker)
                      _isServiceProvider = false;
                    UserRegistrationModel model = new UserRegistrationModel(
                        userName: _userNameController.text,
                        password: _passwordController.text,
                        isCompnay: false,
                        isEmployee: false,
                        isServiceProvider: _isServiceProvider,
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text);
                    _registrationConfirmationDialog(model);
                  }
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
