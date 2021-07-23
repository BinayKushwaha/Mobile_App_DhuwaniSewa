import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Account/Model/AccountModel.dart';
import 'package:mobile_app_dhuwanisewa/CustomValidator/CustomValidator.dart';
import 'package:mobile_app_dhuwanisewa/Enum/UserType.dart';
import 'package:mobile_app_dhuwanisewa/Account/Service/AccountService.dart';
import 'package:mobile_app_dhuwanisewa/ServiceLocator/ServiceLocator.dart';

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
  IAccountService _accountService = getIt<IAccountService>();

  RegistrationFormState({required this.userType});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
                  border: OutlineInputBorder(),
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
                  border: OutlineInputBorder(),
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
                    border: OutlineInputBorder(),
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
                    border: OutlineInputBorder(),
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
              height: 80,
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (userType == UserType.ServiceProvider)
                      _isServiceProvider=true;
                    else if (userType == UserType.ServiceSeeker)
                      _isServiceProvider=false;
                      UserRegistrationModel model=new UserRegistrationModel(
                          userName: _userNameController.text,
                          password: _passwordController.text,
                          isCompnay: false,
                          isEmployee: false,
                          isServiceProvider: _isServiceProvider,
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text);
                      print(model.userName);
                      _accountService.getHome();
                      _accountService.save(model).then((value){
                        print('User regitered succesfully');
                        print(value);
                      });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
