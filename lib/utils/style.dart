// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
export 'extension.dart';

/*
Colors
*/
const Color Main_Color = Color(0xFFFFFFFF);

const Color Color_U_Black = Color(0xFF0F0F0F);

const Color Color_U_Gray = Color(0xFF999999);

const Color Color_Text_Unavailable = Color_U_Gray;

const Color Color_Text_Hint = Color(0xFFBFBFBF);

const Color Color_Border = Color(0x0F0F0F00);

const Color Color_Shadow_Gray = Color(0x0F0F0F00);

const Color Color_Content_Bg = Color(0xFFF3F3F3);

Color randomColor() {
  return Color.fromARGB(255, Random.secure().nextInt(255),
      Random.secure().nextInt(255), Random.secure().nextInt(255));
}

/// TextStyle
const TextStyleLittleTitle =
    TextStyle(fontSize: 13, color: Color_U_Black);

const TextStylePettyTitle =
    TextStyle(fontSize: 14, color: Color_U_Black);

const TextStyleMinorTitle =
    TextStyle(fontSize: 15, color: Color_U_Black);

const TextStyleTitle = TextStyle(fontSize: 16, color: Color_U_Black);

const TextStyleTitleBold =
    TextStyle(fontSize: 17, color: Color_U_Black, fontWeight: FontWeight.bold);

const TextStyleTitleLargeBold =
    TextStyle(fontSize: 21, color: Color_U_Black, fontWeight: FontWeight.bold);

const TextStyleLarge = TextStyle(fontSize: 19, color: Color_U_Black);

const TextStyleLarger = TextStyle(fontSize: 17, color: Color_U_Gray);

const TextStyleMajor = TextStyle(fontSize: 16, color: Color_U_Gray);

const TextStyleContent = TextStyle(fontSize: 15, color: Color_U_Gray);

const TextStyleMediumContent =
    TextStyle(fontSize: 14, color: Color_U_Gray);

const TextStyleLittleContent =
    TextStyle(fontSize: 13, color: Color_U_Gray);

const TextStyleHint = TextStyle(fontSize: 16, color: Color_Text_Hint);

const TextStyleLittleHint =
    TextStyle(fontSize: 13, color: Color_Text_Hint);

const TextStyleH5 =
    TextStyle(fontSize: 32, color: Color_U_Black, fontWeight: FontWeight.w700);

const TextStyleMediumWhite = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

const TextStyleH6White =
    TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.w700);
const TextStyleH6Gray = TextStyle(
    fontSize: 36, color: Color_Text_Hint, fontWeight: FontWeight.w700);
const TextStyleH6Black =
    TextStyle(fontSize: 36, color: Color_U_Black, fontWeight: FontWeight.w700);

const TextStyleH7WhiteTransparent = TextStyle(
    fontSize: 41, color: Color(0x2FFFFFFF), fontWeight: FontWeight.w700);

const TextStyle17White = TextStyle(fontSize: 17, color: Colors.white);

/// ButtonStyle
final TextButtonStyleNormal =
    ButtonStyle(overlayColor: MaterialStateProperty.all(Color_Shadow_Gray));

final AppBarButtonStyle = TextButton.styleFrom(
    foregroundColor: Color_U_Gray, backgroundColor: Colors.transparent,
    shape: const CircleBorder(side: BorderSide.none));

final CancleButtonStyle = TextButton.styleFrom(
  foregroundColor: Color_U_Gray, backgroundColor: Colors.transparent,
);

final ButtonStyle SureButtonStyle = TextButton.styleFrom(
  foregroundColor: Color_U_Black, backgroundColor: Colors.transparent,
);
