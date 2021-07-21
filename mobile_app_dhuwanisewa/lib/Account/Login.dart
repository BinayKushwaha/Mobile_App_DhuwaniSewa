import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Account/Header.dart';
import 'package:mobile_app_dhuwanisewa/Account/ServiceProviderRegistration.dart';
import 'package:mobile_app_dhuwanisewa/Account/ServiceSeekerRegistration.dart';
import 'package:mobile_app_dhuwanisewa/CustomValidator/CustomValidator.dart';

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
      body: ListView(
        padding: EdgeInsets.fromLTRB(10,30,10,0),
        children: [
          appHeading(),
          LoginForm(),
          Container(
            child: Row(
              children: [
                Text('Does not have account ?'),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Registration');
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          )
        ],
      ),
    );
  }
}

class UserRegistrationTypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            appHeading(),
            Container(
              height: 80,
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                child: Text(
                  'Service Provider',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ServiceProviderRegistration()));
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
                  'Service Seeker',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ServiceSeekerRegistration()));
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
                        style: TextStyle(fontSize: 20),
                      ))
                ],
                mainAxisAlignment: MainAxisAlignment.center,
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
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        border: OutlineInputBorder(),
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
                        border: OutlineInputBorder(),
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
                TextButton(
                  onPressed: () {
                    //Forget password code here
                  },
                  child: Text('Forget Password',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                ),
                Container(
                  height: 80,
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(userNameController.text);
                        print(passwordController.text);
                      }
                    },
                  ),
                ),
              ],
            )));
  }
}
