import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebViewPage extends StatelessWidget {
  final String url;
  final dynamic params;
  static final String TITLE = 'title';

  WebViewPage(this.url, {Key? key, this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
