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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.red,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Verify your account",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          children: [appHeading(),AccountVerficationForm(userName: widget.userName)],
        ),
      ),
    );
  }
}