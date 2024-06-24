import 'package:flutter/material.dart';
import 'package:translator/Model/appTheme.dart';

class Styles {
  static TextStyle whiteText(double fontSize) => TextStyle(
    fontSize: fontSize,
    color: Apptheme.white,
    fontFamily: Apptheme.fontFamily,
  );
  static TextStyle blackText(double fontSize) => TextStyle(
    fontSize: fontSize,
    color: Apptheme.black,
    fontFamily: Apptheme.fontFamily,
  );
  static TextStyle primaryText() => const TextStyle(
  fontFamily: Apptheme.fontFamily,
  fontSize: 22.00,
  color: Apptheme.primaryColor,
  );
  static ButtonStyle customTextButton() =>  const ButtonStyle(
    elevation: WidgetStatePropertyAll(0),
    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
  );
  static BoxDecoration textBox() => BoxDecoration(
    border: Border.all(color: Apptheme.grey),
    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
  );
  static ButtonStyle primaryButton() => const ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(Apptheme.secondaryColor),
  );
  static TextStyle splashText() => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}


