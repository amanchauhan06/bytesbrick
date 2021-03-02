import 'package:bytesbrick/UI/Utils/Styles/textStyle.dart';
import 'package:flutter/material.dart';

Padding flatButton(BuildContext context, String text, dynamic onPress, color) {
  return Padding(
    padding: const EdgeInsets.all(0.0),
    child: FlatButton(
      minWidth: MediaQuery.of(context).size.width,
      onPressed: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: Text(
          '$text',
          style: h4WhiteText,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: color,
    ),
  );
}
