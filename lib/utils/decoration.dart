// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:uzuo/utils/style.dart';

import 'package:flutter/widgets.dart';

/**
 * BoxDecoration
 */
// 下划线
final BoxDecoration BottomLineDecoration = BoxDecoration(
    border: Border(bottom: BorderSide(width: 1, color: Color_Border)));

final BoxDecoration TopLineDecoration = BoxDecoration(
    border: Border(top: BorderSide(width: 0.5, color: Color_Border)));

final BoxDecoration AllBorderDecoration =
    BoxDecoration(border: Border.all(color: Color_Border, width: 1));

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
