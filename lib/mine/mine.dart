import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzuo/account/account.dart';
import 'package:uzuo/mine/data_mine.dart';
import 'package:uzuo/mine/v_mine_view.dart';


class MinePage extends StatefulWidget {
  List<MineModule> datas = ModuleModel.data(AccountType.designer);

  @override
  State<StatefulWidget> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {


  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          reverse: false,
          slivers: [
            SliverToBoxAdapter(
              child: MineHeader(),
            ),
            SliverList(delegate: SliverChildBuilderDelegate((content, index){
                return MineItemView(model: widget.datas[index].value());
            }, childCount: widget.datas.length)),
          ],
        )
      ),
    );
  }
}



