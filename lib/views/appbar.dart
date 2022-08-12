import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uzuo/common/style.dart';

AppBar commonAppBar(String title, List<Widget>? actions) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: Color_U_Black, size: 20),
    title: Text(
      title,
      style: TextStyleTitleLargeBold,
    ),
    actions: actions,
    // actions: [
    //   TextButton(
    //       style: AppBarButtonStyle,
    //       onPressed: () {},
    //       child: Text(
    //         '下一步',
    //         style: TextStyleTitleBold,
    //       )),
    // ],
    elevation: 0,
  );
}
