import 'package:bytesbrick/UI/Utils/Styles/textStyle.dart';
import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(
    String hintText,
    ) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    labelText: hintText,
    labelStyle: onBoardText,
    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: Colors.grey, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: Colors.black, width: 1),
    ),
  );
}
