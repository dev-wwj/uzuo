import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzuo/mine/data_mine.dart';
import 'package:uzuo/utils/decoration.dart';
import 'package:uzuo/utils/style.dart';

class MineHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 30, 16, 28),
      child: Row(
        children: [
          CircleAvatar(
              radius: 35,
              backgroundColor: Color_Content_Bg,
              backgroundImage: AssetImage('avatar_placeholder'.locImage())),
          Container(
            padding: EdgeInsets.fromLTRB(8, 12, 0, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NickName',
                  style: TextStyleTitleLargeBold,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'sign...',
                      style: TextStyleMediumContent,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        width: 6.5,
                        height: 10.5,
                        child: Image.asset('icon_indicator'.locImage())),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MineItemView extends StatelessWidget {
  MineItemView({required this.model});

  ModuleModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        model.module.tapAction(context);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(17, 0, 15, 0),
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        decoration: BottomLineDecoration,
        child:  Row(
          children: [
            Image.asset(
              model.imgName.locImage(),
              width: 22,
              height: 22,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              model.title,
              style: TextStyleTitle,
            ),
            Spacer(),
            Image.asset(
              'icon_indicator_black'.locImage(),
              width: 7.5,
            )
          ],
        ),
      ),
    );
  }
}
