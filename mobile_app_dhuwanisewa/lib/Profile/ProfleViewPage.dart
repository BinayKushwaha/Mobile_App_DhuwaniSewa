import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/Model/ResponseModel.dart';
import 'package:mobile_app_dhuwanisewa/ServiceLocator/ServiceLocator.dart';
import 'Model/UserProfileModel.dart';
import 'ProfileService.dart';

class ProfileViewPage extends StatefulWidget {
  int userId;
  @override
  ProfileViewPage({required this.userId});
  ProfileViewPageState createState() {
    return ProfileViewPageState();
  }
}

class ProfileViewPageState extends State<ProfileViewPage> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _citizenshipNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ProfileService _profileService = getIt<ProfileService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<dynamic>(
        future: _profileService.getProfile(widget.userId),
        builder: (BuildContext builder, AsyncSnapshot<dynamic> snapshot) {
          List<Widget> children = <Widget>[];
          if (snapshot.connectionState == ConnectionState.waiting) {
            children = <Widget>[
              Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ];
          } else if (snapshot.hasData) {
            final responseData = snapshot.data;
            ResponseModel data = ResponseModel.fromJson(responseData);
            UserProfileModel userProfileData =
                UserProfileModel.fromJson(data.data);
            children = <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.person_pin_outlined,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Name"),
                  // controller: _fullNameController,
                  initialValue: userProfileData.fullName,
                  readOnly: true,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  // controller: _emailController,
                  initialValue: userProfileData.email,
                  readOnly: true,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Mobile Number"),
                  initialValue: userProfileData.mobileNumber,
                  // controller: _mobileNumberController,
                  readOnly: true,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Citizenship Number"),
                  initialValue: userProfileData.citizenshipNumber,
                  // controller: _citizenshipNumberController,
                  readOnly: true,
                ),
              )
            ];
          }
          return Container(
              child: Card(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 100),
                  child: Form(
                    key: _formKey,
                    child: Column(children: children),
                  )));
        },
      ),
    );
  }
}
