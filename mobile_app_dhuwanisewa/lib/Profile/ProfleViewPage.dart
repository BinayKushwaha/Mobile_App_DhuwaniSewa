import 'package:flutter/material.dart';

class ProfileViewPage extends StatefulWidget {
  @override
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
      body: Container(
          child: Card(
            margin: EdgeInsets.fromLTRB(0,10,0,100),
              child: Form(
        key: _formKey,
        child: Column(
          children: [
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
                initialValue: "Binay Kushwaha",
                readOnly: true,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                // controller: _emailController,
                initialValue: "binaykushwaha",
                readOnly: true,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Mobile Number"),
                initialValue: "9840017309",
                // controller: _mobileNumberController,
                readOnly: true,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Citizenship Number"),
                initialValue: "37199/6734",
                // controller: _citizenshipNumberController,
                readOnly: true,
              ),
            )
          ],
        ),
      ))),
    );
  }
}
