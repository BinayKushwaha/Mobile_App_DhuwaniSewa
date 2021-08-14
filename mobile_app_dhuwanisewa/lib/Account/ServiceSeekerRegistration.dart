import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Enum/UserType.dart';
import 'package:mobile_app_dhuwanisewa/Account/RegistrationForm.dart';
import 'package:mobile_app_dhuwanisewa/Account/Header.dart';

class ServiceSeekerRegistration extends StatefulWidget {
  @override
  ServiceSeekerRegistrationState createState() {
    return ServiceSeekerRegistrationState();
  }
}

class ServiceSeekerRegistrationState
    extends State<ServiceSeekerRegistration> {
  final UserType userType = UserType.ServiceSeeker;
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
        title: Text('Service Seeker',style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black
        ),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [appHeading(),RegistrationForm(userType: userType)],
        ),
      ),
    );
  }
}
