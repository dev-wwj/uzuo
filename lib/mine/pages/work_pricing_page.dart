import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzuo/router.dart';
import 'package:uzuo/utils/decoration.dart';
import 'package:uzuo/utils/style.dart';
import 'package:uzuo/views/appbar.dart';

class WorkPricingPage extends StatelessWidget {
  const WorkPricingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('产品定价', []),
      body: _WorkPricing(),
    );
  }
}

class _InputModel {
  _InputModel({
    required this.title,
    required this.intro,
    required this.unit,
  }) : controller = TextEditingController();

  String title;
  String intro;
  String unit;

  TextEditingController controller;

  String? value;
}

class _WorkPricing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WorkPricingState();
}

class _WorkPricingState extends State<_WorkPricing> {
  List<_InputModel> inputs = [
    _InputModel(title: '作品资源费', intro: '作品单次使用定价', unit: '元'),
    _InputModel(title: '再设计人工耗时', intro: '修改作品文案，简易板式调整', unit: '工时'),
    _InputModel(title: '再设计每工时费用', intro: '按照1天8工时计算，请填写你单个工时的费用', unit: '工时'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.5),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: inputs.map((e) => inputItem(e)).toList(),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).popUntil(ModalRoute.withName(MyRouter.container));
              },
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              color: Color_U_Black,
              child: const Text(
                '发布',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget inputItem(_InputModel model) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20),
      decoration: BottomLineDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.title,
            style: TextStyleTitle,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            model.intro,
            style: TextStyleContent,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  style: TextStyleH6Black,
                  decoration:
                      WInputDecoration.inputDecoration('0', TextStyleH6Gray),
                  keyboardType: TextInputType.none,
                  onChanged: (value) {},
                ),
              ),
              Text(
                model.unit,
                style: TextStyleTitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
