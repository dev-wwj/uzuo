// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:uzuo/mine/pages/tags_picker_page.dart';
import 'package:uzuo/mine/pages/works_category_page.dart';
import 'package:uzuo/utils/dart/map_extension.dart';
import 'package:provider/provider.dart';

enum ActionMode {
  none,
  picker, // 选择图片
  indicator1, // 标签
  indicator2, // 二级标签
  input1, // 输入框
  input2, // 输入框2
}

enum WorkModule {
  cover, // 封面
  classify, // 分类
  industry, // 行业
  uses, // 用途

  format, // 文件格式
  colorMode, // 色彩模式
  dpi, // 分辨率
  size, // 文件大型

  fontCopyright, // 作品字体版权
  accredit, // 作品图片授权
  space, // 分隔线
}

var workModule = [
  WorkModule.cover,
  WorkModule.classify,
  WorkModule.industry,
  WorkModule.uses,
  WorkModule.space,
  WorkModule.format,
  WorkModule.colorMode,
  WorkModule.dpi,
  WorkModule.size,
  WorkModule.space,
  WorkModule.fontCopyright,
  WorkModule.accredit
];

extension ActionWorkModule on WorkModule {
  ActionMode action() {
    switch (this) {
      case WorkModule.cover:
        return ActionMode.picker;
      case WorkModule.classify:
        return ActionMode.indicator2;
      case WorkModule.industry:
      case WorkModule.uses:
      case WorkModule.format:
      case WorkModule.colorMode:
        return ActionMode.indicator1;
      case WorkModule.dpi:
      case WorkModule.size:
        return ActionMode.input1;
      case WorkModule.fontCopyright:
        return ActionMode.picker;
      case WorkModule.accredit:
        return ActionMode.input2;
      default:
        return ActionMode.none;
    }
  }

  void onTap(BuildContext context) {
    WorkInfoModel model = context.read<WorkInfoModel>();
    Future<Map>? map;
    switch (this) {
      case WorkModule.cover:
        break;
      case WorkModule.classify:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChangeNotifierProvider.value(
              value: model, child: const WorksCategoryPage());
        }));
        break;
      case WorkModule.industry:
        map = WMap.readJsonFile('resource/industry.json');
        break;
      case WorkModule.uses:
        map = WMap.readJsonFile('resource/uses.json');
        break;
      case WorkModule.format:
        map = WMap.readJsonFile('resource/file_format.json');
        break;
      case WorkModule.colorMode:
        map = WMap.readJsonFile('resource/color_modes.json');
        break;
      case WorkModule.dpi:
      case WorkModule.size:
      case WorkModule.fontCopyright:
      case WorkModule.accredit:
      default:
    }
    if (action() == ActionMode.indicator1) {
      map!.then((value) {
        String title = value['title'] ?? "";
        List<dynamic> dyTags = value['tags'] ?? [];
        List<String> tags = dyTags.map((e) => e.toString()).toList();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChangeNotifierProvider.value(
            value: model,
            child: TagsPickerPage(
              title: title,
              tags: tags,
              module: this,
            ),
          );
        }));
      });
    }
  }
}

class WorkInfoModel extends ChangeNotifier {
  String? _industry;
  String? _uses;

  String? _format;

  String? _colorMode;

  void set(String value, WorkModule module) {
    switch (module) {
      case WorkModule.cover:
        // TODO: Handle this case.
        break;
      case WorkModule.classify:
        // TODO: Handle this case.
        break;
      case WorkModule.industry:
        _industry = value;
        break;
      case WorkModule.uses:
        _uses = value;
        break;
      case WorkModule.format:
        _format = value;
        break;
      case WorkModule.colorMode:
        _colorMode = value;
        break;
      case WorkModule.dpi:
        // TODO: Handle this case.
        break;
      case WorkModule.size:
        // TODO: Handle this case.
        break;
      case WorkModule.fontCopyright:
        // TODO: Handle this case.
        break;
      case WorkModule.accredit:
        // TODO: Handle this case.
        break;
      case WorkModule.space:
        // TODO: Handle this case.
        break;
    }
    notifyListeners();
  }

  String? value(WorkModule module) {
    switch (module) {
      case WorkModule.cover:
        // TODO: Handle this case.
        break;
      case WorkModule.classify:
        // TODO: Handle this case.
        break;
      case WorkModule.industry:
        return _industry;
      case WorkModule.uses:
        return _uses;

      case WorkModule.format:
        return _format;
      case WorkModule.colorMode:
        return _colorMode;
      case WorkModule.dpi:
        // TODO: Handle this case.
        break;
      case WorkModule.size:
        // TODO: Handle this case.
        break;
      case WorkModule.fontCopyright:
        // TODO: Handle this case.
        break;
      case WorkModule.accredit:
        // TODO: Handle this case.
        break;
      case WorkModule.space:
        // TODO: Handle this case.
        break;
    }
    return null;
  }
}
