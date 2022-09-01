import 'package:uzuo/account/login.dart';
import 'package:fluwx/fluwx.dart' show isWeChatInstalled;

extension WxLoginPageState on LoginPageState {
  void showWechatLogin() {
    isWeChatInstalled.then((value) {
      wxLoginEnable = true;
      setState(() {});
    });
  }
}
