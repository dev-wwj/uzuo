import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:uzuo/account/account.dart';
import 'package:uzuo/common/style.dart';
import 'package:uzuo/router.dart';

class ModuleModel {
  MineModule module;
  String imgName;
  String title;
  ModuleModel(
      {required this.module, required this.imgName, required this.title});

  static List<MineModule> data(AccountType type) {
    switch (type) {
      case AccountType.custom:
        return [
          MineModule.orders,
          MineModule.wallet,
          MineModule.service,
          MineModule.set
        ];
      case AccountType.designer:
        return [
          MineModule.upload,
          MineModule.works,
          MineModule.orders,
          MineModule.delivery,
          MineModule.wallet,
          MineModule.service,
          MineModule.set
        ];
    }
  }
}

enum MineModule {
  upload,
  works,
  orders,
  delivery,
  wallet,
  service,
  set,
}

extension MineMenuData on MineModule {
  ModuleModel value() {
    switch (this) {
      case MineModule.upload:
        return ModuleModel(
            module: this, imgName: 'icon_mine_cloud', title: '上传作品');
      case MineModule.works:
        return ModuleModel(
            module: this, imgName: 'icon_mine_work', title: '我的作品');
      case MineModule.orders:
        return ModuleModel(
            module: this, imgName: 'icon_mine_order', title: '我的订单');
      case MineModule.delivery:
        return ModuleModel(
            module: this, imgName: 'icon_mine_delivery', title: '交付文件');
      case MineModule.wallet:
        return ModuleModel(
            module: this, imgName: 'icon_mine_wallet', title: '钱包');
      case MineModule.service:
        return ModuleModel(
            module: this, imgName: 'icon_mine_service', title: '在线客服');
      case MineModule.set:
        return ModuleModel(module: this, imgName: 'icon_mine_set', title: '设置');
    }
  }

  void tapAction(BuildContext context) {
    switch (this) {
      case MineModule.upload:
        MyRouter.pushNoParams(context, MyRouter.uploadWorks);
        break;
      default:
        break;
    }
  }
}
