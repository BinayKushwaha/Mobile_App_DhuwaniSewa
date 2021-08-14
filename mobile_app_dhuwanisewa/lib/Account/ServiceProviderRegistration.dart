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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.red,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Service Provider',style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black
        ),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(shrinkWrap: true,padding: EdgeInsets.all(10),
          children: [appHeading(),RegistrationForm(userType: userType)],
        ),
      ),
    );
  }
}
