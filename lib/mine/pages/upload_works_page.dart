import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uzuo/common/decoration.dart';
import 'package:uzuo/common/style.dart';
import 'package:uzuo/mine/pages/v_image_picker.dart';
import 'package:uzuo/views/appbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadWorks extends StatelessWidget {
  const UploadWorks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar("上传作品", [
        TextButton(
            style: AppBarButtonStyle,
            onPressed: () {},
            child: Text(
              "下一步",
              style: TextStyleTitleBold,
            ))
      ]),
      body: _EditBody(),
    );
  }
}

class _EditBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditBodyState();
}

class _EditBodyState extends State<_EditBody> {
  final _titelController = TextEditingController();
  final _contentController = TextEditingController();

  List<XFile>? _imageFileList;
  final _picker = ImagePicker();

  String? title;

  @override
  void initState() {
    _titelController.addListener(() {
      title = _titelController.text;
      print(title);
    });
    super.initState();
  }

  @override
  void dispose() {
    _titelController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          sliver: SliverToBoxAdapter(
            child: Container(
              decoration: BottomLineDecoration,
              child: TextFormField(
                controller: _titelController,
                decoration:
                    WInputDecoration.inputDecoration('请输入标题', TextStyleHint),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            height: 160,
            decoration: BottomLineDecoration,
            child: TextFormField(
              maxLines: 10,
              controller: _contentController,
              decoration:
                  WInputDecoration.inputDecoration('请输入作品说明', TextStyleHint),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('点击图片添加图片说明/长按图片排序', style: TextStyleHint),
                const SizedBox(
                  height: 8,
                ),
                Text('电脑端上传请登录：you-zuo.com/login', style: TextStyleLittleHint),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          sliver: SliverGrid(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              if (index == (_imageFileList != null ? _imageFileList!.length : 0)) {
                return AddWidget(
                  onTap: () {
                    permissionHander(context, (bool auth) {
                      if (auth) {
                        pickerImages(context);
                      } else {
                        // 权限设置
                        _dialogAuth(context);
                      }
                    });
                  },
                );
              } else {
                return Semantics(
                  label: 'title',
                  child: Image.file(File(_imageFileList![index].path), fit: BoxFit.cover,),
                );
              }
            }, childCount: _imageFileList != null ? _imageFileList!.length + 1 : 1),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1),
          ),
        ),
      ],
    );
  }

  Future<void> permissionHander(BuildContext context, Function fun) async {
    var status = await Permission.photos.request();
    if (status.isPermanentlyDenied) {
      fun(false);
    } else {
      fun(true);
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty){
      return;
    }
    if (response.file != null) {
      setState((){
        if (response.file == null) {

        }else {
          _imageFileList = response.files;
        }
      });
    }
  }

  Future<void> pickerImages(BuildContext context) async {
    try {
      // final XFile? file =  await _picker.pickImage(source: ImageSource.gallery);
      final List<XFile>? pickedFiles = await _picker.pickMultiImage();
      setState(() {
        _imageFileList = pickedFiles;
      });
    } catch (e) {
      setState(() {
        //TODO: error;
      });
    }
  }

  void _dialogAuth(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              '温馨提示',
              style: TextStyleTitle,
            ),
            content: Text(
              '开启相册访问权限',
              style: TextStyleContent,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('取消', style: TextStyleHint),
                style: CancleButtonStyle,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  '确定',
                  style: TextStyleTitle,
                ),
                style: SureButtonStyle,
              ),
            ],
          );
        });
  }
}
