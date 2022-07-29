import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzuo/mine/mine.dart';
import '../common/gloal.dart';
import '../home/home.dart';
import '../message/message.dart';

class ContainerPage extends StatefulWidget {
  ContainerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  List<Widget>? pages;

  List<BottomNavigationBarItem>? itemList;

  final items = [
    _Item("首页", 'images/icon_tab_home_active.png',
        'images/icon_tab_home_normal.png'),
    _Item("消息", 'images/icon_tab_msg_active.png',
        'images/icon_tab_msg_normal.png'),
    _Item("我的", 'images/icon_tab_mine_active.png',
        'images/icon_tab_mine_normal.png'),
  ];

  int _selectIndex = 0;

  @override
  void initState() {
    super.initState();
    if (pages == null) {
      pages = [HomePage(), MessagePage(), MinePage()];
    }
    if (itemList == null) {
      itemList = items
          .map((e) => BottomNavigationBarItem(
                icon: Image.asset(
                  e.normalIcon,
                  width: 20.0,
                  height: 20.0,
                ),
                activeIcon: Image.asset(
                  e.activeIcon,
                  width: 20.0,
                  height: 20.0,
                ),
                label: e.name,
              ))
          .toList();
    }
  }

  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages![index],
      ),
    );
  }

  @override
  void didUpdateWidget(ContainerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList!,
        onTap: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
        iconSize: 22,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        currentIndex: _selectIndex,
        fixedColor: Color_Text_Normal,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class _Item {
  String name, activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}
