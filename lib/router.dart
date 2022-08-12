import 'package:flutter/material.dart';
import 'package:uzuo/home/home.dart';
import 'package:uzuo/mine/pages/upload_works_page.dart';
import 'package:uzuo/pages/container_page.dart';
import 'pages/web_page.dart';
import 'pages/error_page.dart';

class MyRouter {
  static const container = 'app://';
  static const message = 'app://MessagePage';

  static const uploadWorks = 'app://mine/upload';


  Widget _getPage(String url, dynamic params) {
    if (url.startsWith('https://') || url.startsWith('http://')) {
      return WebViewPage(url, params: params,);
    } else {
      switch (url) {
        case container:
          return ContainerPage();
        case  uploadWorks:
          return UploadWorks();
      }
    }
    return ErrorPage();
  }

  MyRouter.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }

  MyRouter.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
  
}