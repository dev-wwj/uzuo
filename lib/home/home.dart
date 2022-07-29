import 'package:flutter/material.dart';
import 'package:uzuo/common/style.dart';
import 'package:uzuo/home/searchbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _getWidget());
  }
}

DefaultTabController _getWidget() {
  return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        reverse: false,
        slivers: [
          SliverToBoxAdapter(
              child: SearchBar(
            readOnly: true,
            onTap: () {
              print("onTap");
            },
          )),
          SliverToBoxAdapter(
              child: Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Image.asset(
              'img_banner'.locImage(),
              fit: BoxFit.fitWidth,
            ),
          )),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 6, 16, 10),
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, mainAxisSpacing: 15, crossAxisSpacing: 15),
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    color: Colors.blue,
                  );
                },childCount: 10 )),
          ),
        ],
      ));
}
