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
        title: Text('Service Seeker'),
        backgroundColor: Colors.blue,
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
