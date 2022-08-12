import 'package:flutter/material.dart';
import 'package:uzuo/common/style.dart';

class AddWidget extends StatelessWidget {

  final GestureTapCallback? onTap;

  const AddWidget({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTap,
      child: Container(
        // border: Border(bottom: BorderSide(width: 1, color: Color_Border_Line)));
        decoration: BoxDecoration(border: Border.all(color: Color(0xFFBFBFBF))),
        alignment: Alignment.center,
        child: Image.asset('icon_add'.locImage(), width: 25),
      ),
    );
  }
}
