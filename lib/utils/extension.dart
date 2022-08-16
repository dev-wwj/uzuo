import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

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
    return height() - statusBarHeight() - bottomSafeMarge();
  }
}

extension MString on String {
  String locImage() {
    return 'images/' + this + '.png';
  }
}
