import 'package:flutter/material.dart';
import 'package:mobile_app_dhuwanisewa/Enum/ResponseStatus.dart';
import 'package:enum_to_string/enum_to_string.dart';

class CustomNotification {
  static Color _getSnackBarBgColor(String type) {
    if (type == EnumToString.convertToString(ResponseStatus.Info))
      return Colors.cyan;
    else if (type == EnumToString.convertToString(ResponseStatus.Error))
      return Colors.red;
    else
      return Colors.green;
  }

  static showNotification(
      BuildContext context, String message, String notifyType) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle( fontSize: 20),
      ),
      backgroundColor: _getSnackBarBgColor(notifyType),
    ));
  }
}
