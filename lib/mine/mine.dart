// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:uzuo/account/account.dart';
import 'package:uzuo/mine/model/data_mine.dart';
import 'package:uzuo/mine/pages/view/v_mine.dart';

class MinePage extends StatefulWidget {
  List<MineModule> data = ModuleModel.data(AccountType.designer);

  MinePage({super.key});

  @override
  State<StatefulWidget> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        reverse: false,
        slivers: [
          const SliverToBoxAdapter(
            child: MineHeader(),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((content, index) {
            return MineItemView(model: widget.data[index].value());
          }, childCount: widget.data.length)),
        ],
      )),
    );
  }
}
