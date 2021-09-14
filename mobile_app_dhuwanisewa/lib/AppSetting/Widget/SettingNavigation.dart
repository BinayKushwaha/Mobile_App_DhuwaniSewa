import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Account/Model/LoginModel.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/SharedRefrence/SharedRefrence.dart';
import 'package:mobile_app_dhuwanisewa/Constant/Common/CacheKey.dart';
import 'package:mobile_app_dhuwanisewa/Profile/ProfleViewPage.dart';
import 'package:mobile_app_dhuwanisewa/ServiceLocator/ServiceLocator.dart';

class SettingNavigationPage extends StatefulWidget {
  @override
  SettingNavigationPageState createState() {
    return SettingNavigationPageState();
  }
}

class SettingNavigationPageState extends State<SettingNavigationPage> {
  SharedReference _sharedReference = getIt<SharedReference>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: Container(
          // child: CircleAvatar(
          //   radius: 20,
          //   backgroundImage: NetworkImage(
          //       ""),
          // ),
          child: IconButton(
            icon: Icon(
              Icons.person_pin_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        title: FutureBuilder<dynamic>(
          future:
              _sharedReference.getJsonData(Shared_CacheKey.loginCredentials),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            List<Widget> children = <Widget>[];
            if (snapshot.connectionState == ConnectionState.waiting) {
              children = const <Widget>[CircularProgressIndicator()];
            } else if (snapshot.hasData) {
              LoginResponseModel userData =
                  LoginResponseModel.fromJson(snapshot.data);
              children = <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      userData.fullName,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.black),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(userData.userName,
                      style: TextStyle(fontSize: 15, color: Colors.grey[600])),
                )
              ];
            }
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: FutureBuilder<int>(
          future: _sharedReference.getInt(Shared_CacheKey.appUserId),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            List<Widget> children = <Widget>[];
            if (snapshot.connectionState == ConnectionState.waiting) {
              children = [
                Center(
                  child: CircularProgressIndicator(),
                )
              ];
            } else if (snapshot.hasData) {
              int userId = 0;
              if (snapshot.data != null) {
                userId = snapshot.data as int;
              }
              children = [
                Card(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ProfileViewPage(
                            userId: userId,
                          );
                        }));
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      )),
                ),
                Card(
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.contact_phone_outlined,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Contact Person",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      )),
                ),
                Card(
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.drive_eta_rounded,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Vehicle Detail",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      )),
                ),
                Card(
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.settings,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Manage Vehicle",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      )),
                ),
                Card(
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.credit_card,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Recharge",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      )),
                ),
                Card(
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.local_offer,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Offer/Referals",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        ))),
                Card(
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.logout,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      )),
                )
              ];
            }
            return ListView(
              children: children,
            );
          },
        ),
      ),
    );
  }
}
