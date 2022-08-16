import 'package:flutter/material.dart';
import 'package:uzuo/utils/style.dart';

class SlogenView extends StatelessWidget {
  const SlogenView({super.key});

  @override
  Widget build(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(8)
      ),
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Row(
        children: [
          SizedBox(
            width: 37,
            height: 37,
            child: Image.asset('icon_uzuo'.locImage()),
          ),
          SizedBox(
            width: 11.5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '设计再生平台',
                style: TextStyleTitleBold,
              ),
              Text(
                '做同样的设计，花1/10的价格',
                style: TextStyleLittleContent,
              )
            ],
          ),
          Spacer(),
          SizedBox(
            width: 9,
            height: 15,
            child: Image.asset("icon_indicator".locImage()),
          )
        ],
      ),
    );
  }
}
