import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/style.dart';

class ProfessionWidget extends StatelessWidget {
  const ProfessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        key: this.key,
        child: Container(
          margin: EdgeInsets.fromLTRB(16, 88, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("选择你的身份", style: TextStyleH5),
              SizedBox(height: 45),
              ProfessionCard(
                title: "我是设计师",
                intro: "Designer",
                colors: [
                  const Color(0xFFFF0000),
                  const Color(0xFFFC7A7A),
                ],
                onTap: () {},
              ),
              SizedBox(height: 20),
              ProfessionCard(
                title: "我是客户",
                intro: "Customer",
                colors: [
                  const Color(0xFF0265FC),
                  const Color(0xFF37B3F0),
                ],
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfessionCard extends StatelessWidget {
  const ProfessionCard({
    super.key,
    required this.title,
    required this.intro,
    required this.colors,
    this.onTap,
  });

  final String title;
  final String intro;
  final List<Color> colors;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      width: context.width() - 32,
      height: 140,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        splashColor: colors.first,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(32, 35, 0, 0),
              child: Text(
                title,
                style: TextStyleH6White,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(32, 87, 0, 0),
              child: Text(
                intro,
                style: TextStyle17White,
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.fromLTRB(0, 25, 22, 0),
              child: Text(intro, style: TextStyleH7WhiteTransparent),
            ),
            Positioned(
              width: 21,
              height: 15,
              right: 22,
              top: 88,
              child: Image.asset('images/arrow.png'),
            )
          ],
        ),
      ),
    );
  }
}
