import 'package:flutter/material.dart';
import 'package:uzuo/views/searchbar.dart';
import 'package:uzuo/utils/decoration.dart';
import 'package:uzuo/utils/style.dart';

// ignore: must_be_immutable
class InfoSearcher extends StatefulWidget {
  InfoSearcher({super.key, required this.title, this.separator = true});

  String title;
  bool separator;
  List<String> tags = ['方正雅黑', '方正宋体'];

  @override
  State<StatefulWidget> createState() => InfoSearcherState();
}

class InfoSearcherState extends State<InfoSearcher> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15.5, 24, 15.5, 10),
          child: Text(
            widget.title,
            style: TextStyleTitle,
          ),
        ),
        const SearchBar(
          readOnly: true,
          hint: '搜索版权字体',
        ),
        Container(
          padding: const EdgeInsets.all(15.5),
          decoration: BottomLineDecoration,
          child: Wrap(spacing: 12, runSpacing: 10, children: _tags(context)),
        )
      ],
    );
  }

  List<Widget> _tags(BuildContext context) {
    List<Widget> tags = [];
    for (var element in widget.tags) {
      tags.add(Container(
        padding: const EdgeInsets.fromLTRB(18, 11, 15, 11),
        decoration: AllBorderDecoration,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              element,
              style: TextStyleMinorTitle,
            ),
            InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'icon_close_circle'.locImage(),
                  width: 15.5,
                ),
              ),
              onTap: () {
                setState(() {
                  widget.tags.remove(element);
                });
              },
            ),
            // IconButton(onPressed: (){}, icon: Image.asset('icon_close_circle'.locImage()), iconSize: 0.5,),
            // Image.asset('icon_close_circle'.locImage(), width: 15.5,),
          ],
        ),
      ));
    }
    return tags;
  }
}
