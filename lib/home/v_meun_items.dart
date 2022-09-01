import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uzuo/utils/style.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Ink(
      child: InkWell(
        child: Column(
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: Image.asset('icon_meun_ui'.locImage()),
            ),
            SizedBox(
              height: 8,
            ),
            Text('name', style: TextStyle(fontSize: 13, color: Color_U_Black)),
          ],
        ),
      ),
    );
  }
}
