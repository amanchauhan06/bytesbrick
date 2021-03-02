import 'package:bytesbrick/UI/Utils/Styles/textStyle.dart';
import 'package:flutter/material.dart';

showInSnackBar(context, String value) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      "$value",
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: h6WhiteText,
    ),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.black,
  ));
}