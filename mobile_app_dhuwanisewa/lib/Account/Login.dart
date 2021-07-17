import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Enum/AccountFormType.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AccountFormType _formType = AccountFormType.Login;

  void _accountFormChange() async {
    setState(() {
      if (_formType == AccountFormType.Login)
        _formType = AccountFormType.Register;
      else
        _formType = AccountFormType.Login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'DhuwaniSewa',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Text(
                    'Easy Transportation',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ] +
              _formBuilder(),
        ),
      ),
    );
  }

  List<Widget> _formBuilder() {
    if (_formType == AccountFormType.Login) {
      return <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: userNameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
                hintText: 'Email or Mobile number'),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            //Forget password code here
          },
          child: Text('Forget Password',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
        ),
        Container(
          height: 50,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
            child: Text('Login'),
            onPressed: () {
              print(userNameController.text);
              print(passwordController.text);
            },
          ),
        ),
        Container(
          child: Row(
            children: [
              Text('Does not have account ?'),
              TextButton(
                  onPressed: _accountFormChange,
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        )
      ];
    } else {
      return <Widget>[
        Container(
          height: 80,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
            child: Text(
              'Service Provider',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            onPressed: () {
              print('Service Provider pressed');
            },
          ),
        ),
        Container(
          height: 80,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
            child: Text(
              'Service Seeker',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            onPressed: () {
              print('Service Seeker pressed');
            },
          ),
        ),
        Container(
          child: Row(
            children: [
              Text('Already have an account ?'),
              TextButton(
                  onPressed: _accountFormChange,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        )
      ];
    }
  }
}
