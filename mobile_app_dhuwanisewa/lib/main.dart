import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Account/Login.dart';

void main() => runApp(DhuwaniSewaApp());

class DhuwaniSewaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppHome();
  }
}
class AppHome extends StatefulWidget{
  @override
  AppHomeState createState(){
    return AppHomeState();
  }
}
class AppHomeState extends State<AppHome>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blueAccent),
      title: 'DhuwaniSewa',
      initialRoute: '/',
      routes: {
        '/': (context) {
          return LoginPage();
        },
        '/Registration': (context) {
          return UserRegistrationTypePage();
        }
      },
    );
  }
}