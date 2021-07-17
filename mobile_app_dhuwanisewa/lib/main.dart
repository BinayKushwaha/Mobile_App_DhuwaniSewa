import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Account/Login.dart';
void main()=>runApp(DhuwaniSewaApp());

class DhuwaniSewaApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
        title: 'Simple Login App',
        home: LoginPage()
    );
  }
}
