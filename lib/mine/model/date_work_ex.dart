// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:uzuo/mine/model/data_work.dart';
import 'package:uzuo/mine/pages/view/v_cover_picker.dart';
import 'package:uzuo/mine/pages/view/v_info_item.dart';
import 'package:uzuo/mine/pages/view/v_info_search.dart';
import 'package:uzuo/utils/style.dart';
import 'package:provider/provider.dart';

extension ViewWorkModule on WorkModule {
  Widget view(BuildContext context) {
    switch (this) {
      case WorkModule.cover:
        return SizedBox(
          height: 270,
          child: CoverPicker(),
        );
      case WorkModule.classify:
      case WorkModule.industry:
      case WorkModule.format:
      case WorkModule.colorMode:
      case WorkModule.uses:
        return InfoIndicator(
          title: title() ?? "",
          value: value(context),
          onTap: () {
            onTap(context);
          },
          separator: this != WorkModule.uses,
        );
      case WorkModule.dpi:
        return const InfoEditor(unit: '像素', hint: '请填写尺寸/分辨率');
      case WorkModule.size:
        return const InfoEditor(
          unit: 'MB',
          hint: '请填写文件大小',
          separator: false,
        );
      case WorkModule.fontCopyright:
        return InfoSearcher(
          title: '作品字体版权',
        );
      case WorkModule.accredit:
        return const InfoImporter(title: '作品图片授权', unit: '张', hint: '请输入图片数量');
      case WorkModule.space:
        return Container(
          color: Color_Content_Bg,
          height: 10,
        );
      default:
        return Container(
          color: Color_Content_Bg,
          height: 10,
        );
    }
  }

  String? title() {
    switch (this) {
      case WorkModule.classify:
        return "分类";
      case WorkModule.industry:
        return "行业";
      case WorkModule.uses:
        return "用途";
      case WorkModule.format:
        return "文件格式";
      case WorkModule.colorMode:
        return "色彩格式";
      case WorkModule.fontCopyright:
        return "作品字体版权";
      case WorkModule.accredit:
        return "作品图片授权";
      default:
        return null;
    }
  }

  String? value(BuildContext context) {
    return context.watch<WorkInfoModel>().value(this) ?? "";
  }
}
