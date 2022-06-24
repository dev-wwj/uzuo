import 'dart:io';

/*验证是否是手机号*/
class RegExpUtil {
  static bool VerifyPhone(String? value) {
    if (value == null) {
      return false;
    }
    if (RegExp(r'1(3|4|5|6|7|8|9)\d{9}').hasMatch(value.trim()) &&
        value.trim().length == 11) {
      return true;
    }
    return false;
  }
}
