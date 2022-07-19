import 'dart:ui';

import 'package:flutter/material.dart';

final Color Color_Text_Normal = Color(0xFF0F0F0F);

final Color Color_Text_Content = Color(0xFF999999);

final Color Color_Text_Unavailable = Color_Text_Content;

final Color Color_Text_Hint = Color(0xFFBFBFBF);

final Color Color_Border_Line = Color(0x0F0F0F00);

final Color Color_Shadow_Gray = Color(0x0F0F0F00);

InputDecoration _inputDecoration(String text) {
  return InputDecoration(
    hintText: text,
    hintStyle: TextStyle(fontSize: 16, color: Color_Text_Hint),
    border: InputBorder.none,
  );
}

extension SimpleContext on BuildContext {
  double width() {
    return MediaQuery.of(this).size.width;
  }

  double height() {
    return MediaQuery.of(this).size.height;
  }

  double statusBarHeight() {
    return MediaQuery.of(this).padding.top;
  }

  double bottomSafeMarge() {
    return MediaQuery.of(this).padding.bottom;
  }

  double safeHeight() {
    return height() -
        statusBarHeight() -
        bottomSafeMarge();
  }
}


