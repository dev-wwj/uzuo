import 'package:flutter/material.dart';

import 'gloal.dart';
import 'package:flutter/widgets.dart';

/**
 * BoxDecoration
 */
// 下划线
final BoxDecoration BottomLineDecoration = BoxDecoration(
    border: Border(bottom: BorderSide(width: 1, color: Color_Border_Line)));

final BoxDecoration TopLineDecoration = BoxDecoration(
    border: Border(top: BorderSide(width: 0.5, color: Color_Border_Line)));

extension WInputDecoration on InputDecoration {
  static InputDecoration inputDecoration(hintText, hintStyle,
      {border = InputBorder.none}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: hintStyle,
      border: border,
    );
  }
}
