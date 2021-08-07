import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Account/Header.dart';
import 'package:mobile_app_dhuwanisewa/Account/AccountVerificationForm.dart';

class VerifyAccount extends StatefulWidget{
  final String userName;
  VerifyAccount({Key? key,required this.userName}):super(key: key);

  @override
  VerifyAccountState createState(){
    return VerifyAccountState();
  }
}

class VerifyAccountState extends State<VerifyAccount>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify your account"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [appHeading(),AccountVerficationForm(userName: widget.userName)],
        ),
      ),
    );
  }
}