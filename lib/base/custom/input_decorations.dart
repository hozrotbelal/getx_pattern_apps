import 'package:flutter/material.dart';

import '../../constants.dart';

class InputDecorations {
  static InputDecoration buildInputDecoration_1(
      {radius = 5.0, hint_text = ""}) {
    return InputDecoration(
        hintText: hint_text,
        hintStyle: const TextStyle(fontSize: 12.0, color: textfieldGrey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: textfieldGrey, width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: textfieldGrey, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        contentPadding: EdgeInsets.only(left: 16.0));
  }

  static InputDecoration buildInputDecoration_phone({hint_text = ""}) {
    return InputDecoration(
        hintText: hint_text,
        hintStyle: const TextStyle(fontSize: 12.0, color: textfieldGrey),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: textfieldGrey, width: 0.5),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0)),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: textfieldGrey, width: 1.0),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0))),
        contentPadding: EdgeInsets.only(left: 16.0));
  }
}
