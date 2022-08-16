import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        key: this.key,
        child: Container(
          margin: EdgeInsets.fromLTRB(16, 88, 16, 0),
          child: SizedBox()
        ),
      ),
    );
  }
}

