import 'package:flutter/material.dart';
import 'package:uzuo/mine/model/data_mine.dart';
import 'package:uzuo/utils/decoration.dart';
import 'package:uzuo/utils/style.dart';

class MineHeader extends StatelessWidget {
  const MineHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 28),
      child: Row(
        children: [
          CircleAvatar(
              radius: 35,
              backgroundColor: Color_Content_Bg,
              backgroundImage: AssetImage('avatar_placeholder'.locImage())),
          Container(
            padding: const EdgeInsets.fromLTRB(8, 12, 0, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NickName',
                  style: TextStyleTitleLargeBold,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'sign...',
                      style: TextStyleMediumContent,
                    ),
                    const SizedBox(
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

// ignore: must_be_immutable
class MineItemView extends StatelessWidget {
  MineItemView({super.key, required this.model});

  ModuleModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        model.module.tapAction(context);
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(17, 0, 15, 0),
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        decoration: BottomLineDecoration,
        child: Row(
          children: [
            Image.asset(
              model.imgName.locImage(),
              width: 22,
              height: 22,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              model.title,
              style: TextStyleTitle,
            ),
            const Spacer(),
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
