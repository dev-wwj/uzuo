// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:uzuo/mine/model/data_work.dart';
import 'package:uzuo/mine/model/date_work_ex.dart';
import 'package:uzuo/mine/pages/work_pricing_page.dart';
import 'package:uzuo/utils/style.dart';
import 'package:uzuo/views/appbar.dart';
import 'package:provider/provider.dart';

class EditWorkInfoPage extends StatelessWidget {
  const EditWorkInfoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WorkInfoModel>(
      create: (_) => WorkInfoModel(),
      child: Scaffold(
        appBar: commonAppBar("作品信息", [
          TextButton(
              style: AppBarButtonStyle,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WorkPricingPage()));
              },
              child: const Text(
                "下一步",
                style: TextStyleTitleBold,
              ))
        ]),
        body: _InfoBody(),
      ),
    );
  }
}

class _InfoBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InfoBodyState();
}

class _InfoBodyState extends State<_InfoBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return workModule[index].view(context);
      },
      itemCount: workModule.length,
    );
  }
}
