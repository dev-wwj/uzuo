// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:uzuo/mine/model/data_work.dart';
import 'package:uzuo/utils/decoration.dart';
import 'package:uzuo/utils/style.dart';
import 'package:uzuo/views/appbar.dart';
import 'package:provider/provider.dart';

class WorksCategoryPage extends StatelessWidget {
  const WorksCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('作品分类', null),
      body: _TagsPicker(),
    );
  }
}

class DualElement {
  DualElement({required this.name, this.secondary, this.isOpen = false});
  String name;
  List<String>? secondary;
  bool isOpen;
}

class _TagsPicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TagsPickerState();
}

class _TagsPickerState extends State<_TagsPicker> {
  List<DualElement> list = [
    DualElement(name: '平面', secondary: [
      '品牌',
      '标志',
      '吉祥物',
      '图案',
      '字体/字形',
      '宣传品',
      '海报',
      '包装',
      '书装/画册',
      '信息图表',
      'PPT/演示',
      '书籍',
      '其他平面'
    ]),
    DualElement(name: 'UI', secondary: [
      '图标',
      'APP界面',
      '主题/皮肤',
      '游戏UI',
      '软件界面',
      '交互/UE',
      '流程/UE',
      '闪屏/壁纸',
      '动效设计',
      '其他UI'
    ]),
    DualElement(name: '网页', secondary: [
      '企业官网',
      '门户/社交',
      '电商',
      '专题/活动',
      '游戏/娱乐',
      '个人网站/博客',
      '移动端网页',
      'Banner/广告图',
      '其他网页'
    ]),
    DualElement(name: '插画', secondary: [
      '商业插画',
      '概念设定',
      '绘本',
      '儿童插画',
      '游戏原画',
      '涂鸦/潮流',
      '像素画',
      '插画习作',
      '其他插画'
    ]),
    DualElement(name: '动漫', secondary: [
      '单幅漫画',
      '短篇/四格漫画',
      '中/长篇漫画',
      '时事漫画',
      '肖像漫画',
      '绘本',
      '网络表情',
      '动画片',
      '三维动画',
      '其他动漫'
    ]),
    DualElement(name: '摄影', secondary: [
      '人像',
      '风光',
      '人文/纪实',
      '静物',
      '动物',
      '产品',
      '环境/建筑',
      '修图/后期',
      '时尚',
      '手机',
      '微距',
      '黑白',
      '胶片',
      '生态',
      '游记',
      '小品',
      '其他摄影'
    ]),
    DualElement(
        name: '空间',
        secondary: ['建筑设计', '室内设计', '舞台设计', '展示设计', '景观设计', '导视设计', '其他空间']),
    DualElement(name: '工业/产品', secondary: [
      '生活用品',
      '交通工具',
      '电子产品',
      '工业用品/机械',
      '人机交互',
      '器皿',
      '家具',
      '玩具',
      '礼品/纪念品',
      '其他工业/产品'
    ]),
    DualElement(name: '三维', secondary: [
      '机械/交通',
      '人物/生物',
      '场景',
      '动画/影视',
      '建筑/空间',
      '动漫',
      '展览',
      '产品',
      '其他三维'
    ]),
    DualElement(name: '影视', secondary: [
      '短片',
      'MV',
      '长片',
      '后期/剪辑',
      '栏目包装',
      '影视合成/剪辑',
      'Motion Graphic',
      '设定/分镜',
      '宣传片',
      '其他影视'
    ]),
    DualElement(
        name: '手工艺', secondary: ['铁艺', '皮艺', '工艺品设计', '手办/原型', '首饰', '其他手工']),
    DualElement(name: '纯艺术', secondary: [
      '油画',
      '国画',
      '彩铅',
      '装置',
      '雕塑',
      '水彩',
      '水粉',
      '素描',
      '钢笔画',
      '速写',
      '版画',
      '书法',
      '沙画',
      '其他艺创'
    ]),
    DualElement(name: '服装', secondary: [
      '运动服装',
      '正装/礼服',
      '休闲/流行服饰',
      '童装',
      '内衣',
      '泳衣',
      '鞋类',
      '装备',
      '辅料',
      '面料/印花',
      '其他服装'
    ]),
    DualElement(
        name: '其他', secondary: ['文案策划', '墙绘/立体画', '独立游戏', 'VR设计', '其他']),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expandedHeaderPadding: const EdgeInsets.all(0),
        dividerColor: Color_Border,
        elevation: 1,
        expansionCallback: (index, bool bool) {
          setState(() {
            list[index].isOpen = !bool;
          });
        },
        children: list.map((elem) {
          return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text(elem.name),
                );
              },
              body: Column(
                children: elem.secondary?.map((e) {
                      return InkWell(
                        onTap: () {
                          context
                              .read<WorkInfoModel>()
                              .set( WorkClassify(category: elem.name,detail: e), WorkModule.classify);
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15.5),
                          alignment: Alignment.centerLeft,
                          height: 63,
                          decoration: BottomLineDecoration,
                          child: Text(
                            e,
                            style: TextStyleContent,
                          ),
                        ),
                      );
                    }).toList() ??
                    [],
              ),
              isExpanded: elem.isOpen);
        }).toList(),
      ),
    );
  }
}
