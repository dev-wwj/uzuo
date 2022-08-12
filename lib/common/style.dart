import 'dart:math';

import 'package:flutter/material.dart';
import '../common/extension.dart';
export 'extension.dart';

/*
Colors
*/
final Color Main_Color = Color(0xFFFFFFFF);

final Color Color_U_Black = Color(0xFF0F0F0F);

final Color Color_U_Gray = Color(0xFF999999);

final Color Color_Text_Unavailable = Color_U_Gray;

final Color Color_Text_Hint = Color(0xFFBFBFBF);

final Color Color_Border_Line = Color(0x0F0F0F00);

final Color Color_Shadow_Gray = Color(0x0F0F0F00);

final Color Color_Content_Bg = Color(0xFFF3F3F3);

Color randomColor() {
  return Color.fromARGB(255, Random.secure().nextInt(255),
      Random.secure().nextInt(255), Random.secure().nextInt(255));
}

/**
 * TextStyle
 */
final TextStyle TextStyleLittleTitle =
    TextStyle(fontSize: 13, color: Color_U_Black);

final TextStyle TextStyleMediumTitle =
    TextStyle(fontSize: 14, color: Color_U_Black);

final TextStyle TextStyleTitle = TextStyle(fontSize: 16, color: Color_U_Black);

final TextStyle TextStyleTitleBold =
    TextStyle(fontSize: 17, color: Color_U_Black, fontWeight: FontWeight.bold);

final TextStyle TextStyleTitleLargeBold =
    TextStyle(fontSize: 21, color: Color_U_Black, fontWeight: FontWeight.bold);

final TextStyle TextStyleLarge = TextStyle(fontSize: 19, color: Color_U_Black);

final TextStyle TextStyleContent = TextStyle(fontSize: 15, color: Color_U_Gray);

final TextStyle TextStyleMediumContent =
    TextStyle(fontSize: 14, color: Color_U_Gray);

final TextStyle TextStyleLittleContent =
    TextStyle(fontSize: 13, color: Color_U_Gray);

final TextStyle TextStyleHint = TextStyle(fontSize: 16, color: Color_Text_Hint);

final TextStyle TextStyleLittleHint =
    TextStyle(fontSize: 13, color: Color_Text_Hint);

final TextStyle TextStyleH5 =
    TextStyle(fontSize: 32, color: Color_U_Black, fontWeight: FontWeight.w700);

final TextStyle TextStyleH6White =
    TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.w700);

final TextStyle TextStyleH7WhiteTransparent = TextStyle(
    fontSize: 41, color: Color(0x2FFFFFFF), fontWeight: FontWeight.w700);

final TextStyle TextStyle17White = TextStyle(fontSize: 17, color: Colors.white);

/**
 * ButtonStyle
 */
// ignore: non_constant_identifier_names
final ButtonStyle TextButtonStyleNormal =
    ButtonStyle(overlayColor: MaterialStateProperty.all(Color_Shadow_Gray));

// ignore: non_constant_identifier_names
final ButtonStyle AppBarButtonStyle = TextButton.styleFrom(
    primary: Color_U_Gray,
    backgroundColor: Colors.transparent,
    shape: const CircleBorder(side: BorderSide.none));

final ButtonStyle CancleButtonStyle = TextButton.styleFrom(
  primary: Color_U_Gray,
  backgroundColor: Colors.transparent,
);

final ButtonStyle SureButtonStyle = TextButton.styleFrom(
  primary: Color_U_Black,
  backgroundColor: Colors.transparent,
);
