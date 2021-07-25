import 'package:flutter/material.dart';

class SnackBarPage extends StatefulWidget{
  @override
  SnackBarPageState createState(){
    return SnackBarPageState();
  }
}
class SnackBarPageState extends State<SnackBarPage>{
  final GlobalKey<SnackBarPageState> scaffoldKey = new GlobalKey<SnackBarPageState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
    );
  }
}