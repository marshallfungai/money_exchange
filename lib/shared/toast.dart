import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../shared/colors.dart';

class ToastMessage {
  final String message;

  ToastMessage({@required this.message});

  void showMessage() {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: kAccentColor3,
        textColor: Colors.white,
        fontSize: 18.0);
  }
}
