import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Enum/UserType.dart';
import 'package:mobile_app_dhuwanisewa/Account/RegistrationForm.dart';
import 'package:mobile_app_dhuwanisewa/Account/Header.dart';

class ServiceProviderRegistration extends StatefulWidget {
  @override
  ServiceProviderRegistrationState createState() {
    return ServiceProviderRegistrationState();
  }
}

class ServiceProviderRegistrationState
    extends State<ServiceProviderRegistration> {
  final UserType userType = UserType.ServiceProvider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Provider'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: ListView(shrinkWrap: true,padding: EdgeInsets.all(10),
          children: [appHeading(),RegistrationForm(userType: userType)],
        ),
      ),
    );
  }
}
