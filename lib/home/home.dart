import 'package:flutter/material.dart';
import 'package:uzuo/home/v_meun_items.dart' show ItemView;
import 'package:uzuo/views/searchbar.dart';
import 'package:uzuo/home/v_product_card.dart';
import 'package:uzuo/home/v_slogen.dart';
import 'package:uzuo/utils/style.dart';
// ignore: depend_on_referenced_packages
import 'package:waterfall_flow/waterfall_flow.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _getWidget(context));
  }
}

DefaultTabController _getWidget(BuildContext context) {
  return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: SearchBar(
            readOnly: true,
            hint: '搜索设计类别/行业/用途',
            onTap: () {
              print("onTap");
            },
          )),
          SliverToBoxAdapter(
              child: Container(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Image.asset(
              'img_banner'.locImage(),
              fit: BoxFit.fitWidth,
            ),
          )),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
            sliver: SliverGrid(
                // gridDelegate:
                // SliverGridDelegateWithMaxCrossAxisExtent(
                //   maxCrossAxisExtent: context.width()/5,
                //   mainAxisExtent: context.width()/5,
                //   mainAxisSpacing: 15,
                //   crossAxisSpacing: 15,
                // ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15),
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return ItemView();
                }, childCount: 10)),
          ),
          SliverToBoxAdapter(
              child: Container(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: const SlogenView(),
          )),
          SliverWaterfallFlow(
              delegate: SliverChildBuilderDelegate((BuildContext c, int idx) {
                final Color color = randomColor();
                return ProductCard();
              }),
              gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  collectGarbage: (List<int> garbages) {
                    print('collect garbage : $garbages');
                  },
                  viewportBuilder: (int firstIndex, int lastIndex) {
                    print('viewport : [$firstIndex, $lastIndex]');
                  })),
        ],
      ));
}
