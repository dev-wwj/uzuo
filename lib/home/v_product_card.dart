import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uzuo/utils/extension.dart';
import 'package:uzuo/utils/style.dart';

class ProductCard extends StatelessWidget {
  final double rate = (1 + Random.secure().nextInt(100) / 300);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.white70,
      ),
      child: Column(
        children: [
          SizedBox(
            width: (context.width() / 2) - 18,
            height: (context.width() / 2) * rate,
            child: Image.asset(
              'img_placeholder'.locImage(),
              fit: BoxFit.cover,
            ),
          ),
          _ProductIntro(),
        ],
      ),
    );
  }
}

class _ProductIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(14, 10, 14, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "title",
            style: TextStyleTitle,
          ),
          SizedBox(height: 5),
          Text(
            "detaill",
            style: TextStyleLittleContent,
          ),
          SizedBox(height: 5),
          _UserCard()
        ],
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        CircleAvatar(
          radius: 12.5,
          backgroundColor: Color(0xFFEEEEEE),
          backgroundImage: AssetImage('avatar_placeholder'.locImage()),
        ),
        SizedBox(width: 5,),
        Text(
          'name',
          style: TextStyleLittleTitle,
        ),
      ],
    );
  }
}
