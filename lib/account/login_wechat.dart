import 'dart:ffi';
import 'dart:io';

import 'package:uzuo/account/login.dart';
import 'package:fluwx/fluwx.dart';
extension WxLoginPageState on LoginPageState {

  void showWechatLogin(){
    isWeChatInstalled.then((value) {
      this.wxLoginEnable = true;
      this.setState(() {
      });
    });
  }
}