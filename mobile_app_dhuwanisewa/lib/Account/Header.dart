import 'package:flutter/material.dart';

Widget appHeading() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.fromLTRB(10,10,10,0),
        alignment: Alignment.center,
        child: Text(
          'DhuwaniSewa',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 30),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(10,0,10,10),
        alignment: Alignment.center,
        child: Text(
          'Easy Transportation',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      )
    ],
  );
}

