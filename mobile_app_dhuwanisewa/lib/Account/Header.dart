import 'package:flutter/material.dart';

Widget appHeading() {
  return Container(
      margin:EdgeInsets.all(10) ,
      child: Column(
      children: [
        Container(
          child: Text(
            'DhuwaniSewa',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 30),
          ),
        ),
        Container(
          child: Text(
            'Easy Transportation',
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        )
      ],
    )
  );
}

