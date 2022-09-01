import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzuo/account/login_wechat.dart';
import 'package:uzuo/utils/decoration.dart';
import 'package:uzuo/utils/extension.dart';
import 'package:uzuo/utils/regexp.dart';
import 'package:uzuo/utils/style.dart';
import '../account/profession.dart';
import '../router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  final int countdown = 60;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String? _phone;
  String? _verifyCode;

  Timer? _timer;
  int _seconds = 60;
  String _verifyStr = '获取验证码';
  bool _codeEnable = false;
  bool _showShadow = false;
  bool _loginEnable = false;
  bool wxLoginEnable = false;

  @override
  void initState() {
    super.initState();
    _seconds = widget.countdown;
    showWechatLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        key: _formKey,
        child: SingleChildScrollView(
            child: Container(
          height: context.safeHeight(),
          width: context.width(),
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 60,
              ),
              Container(
                width: context.width(),
                child: const Text(
                  "登录后更精彩",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                decoration: BottomLineDecoration,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  style: TextStyleTitle,
                  decoration:
                      WInputDecoration.inputDecoration("请输入手机号", TextStyleHint),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    _phone = value;
                    _codeEnable = RegExpUtil.VerifyPhone(value);
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BottomLineDecoration,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: Container(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        style: TextStyleTitle,
                        decoration: WInputDecoration.inputDecoration(
                            "请输入验证码", TextStyleHint),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _verifyCode = value;
                          _loginEnable = value.length >= 6;
                          setState(() {});
                        },
                      ),
                    )),
                    GestureDetector(
                      onTap: (_seconds == widget.countdown) && _codeEnable
                          ? () {
                              if (_timer == null) {
                                _startTimer();
                                _codeEnable = false;
                              } else {
                                if (_timer!.isActive) {
                                  return;
                                } else {
                                  _startTimer();
                                  _codeEnable = false;
                                }
                              }
                              setState(() {});
                            }
                          : null,
                      onTapDown: _codeEnable
                          ? (details) {
                              _showShadow = true;
                              setState(() {});
                            }
                          : null,
                      onTapUp: _showShadow
                          ? (details) {
                              _showShadow = false;
                              setState(() {});
                            }
                          : null,
                      onTapCancel: _showShadow
                          ? () {
                              _showShadow = false;
                              setState(() {});
                            }
                          : null,
                      child: Container(
                        width: 98.0,
                        height: 35,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 13.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0,
                                color: _codeEnable
                                    ? Color_U_Black
                                    : Color_Text_Unavailable),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            boxShadow: _showShadow
                                ? [
                                    BoxShadow(
                                        color: Color_Shadow_Gray,
                                        offset: Offset(2, 2),
                                        blurRadius: 5,
                                        spreadRadius: 5)
                                  ]
                                : null),
                        child: Text(
                          _verifyStr,
                          style: _codeEnable
                              ? TextStylePettyTitle
                              : TextStyleMediumContent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: context.width(),
                height: 50,
                child: Opacity(
                    opacity: _loginEnable ? 1.0 : 0.3,
                    child: MaterialButton(
                      onPressed: () {
                        if (_loginEnable) {
                          //TODO: login
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfessionWidget()));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      color: Color(0xFF0F0F0F),
                      child: Text(
                        '登录',
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                      ),
                    )),
              ),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  TextButton(
                    onPressed: () {
                      showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text(
                                '收不到验证码？',
                                style: TextStyleLarge,
                              ),
                              content: Container(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  '1.请检查是否输入正确的手机号码\n2.检查手机是否停机\n3.请使用其他账号登录\n4.请联系官方客服：021-60554294',
                                  style: TextStyleContent,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              actions: [
                                Container(
                                  decoration: TopLineDecoration,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: TextButtonStyleNormal,
                                    child: Text(
                                      '我知道了',
                                      style: TextStyleTitleBold,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    style: TextButtonStyleNormal,
                    child: Text(
                      '收不到验证码？',
                      style: TextStyle(color: Color_U_Gray),
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              Offstage(
                offstage: !wxLoginEnable,
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: IconButton(
                    onPressed: () {
                      MyRouter.pushNoParams(context, MyRouter.container);
                    },
                    icon: Image.asset('images/wechat.png'),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Login',
        style: TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, color: Color(0x0F0F0F)),
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        _cancelTimer();
        _seconds = widget.countdown;
        setState(() {});
        return;
      }
      _seconds--;
      _verifyStr = '$_seconds' + '秒';
      setState(() {});
      if (_seconds == 0) {
        _verifyStr = '重新发送';
        _codeEnable = RegExpUtil.VerifyPhone(_phone);
        setState(() {});
      }
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
  }
}
