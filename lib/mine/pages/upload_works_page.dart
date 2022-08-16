import 'package:flutter/material.dart';
import 'package:uzuo/common/image_preview.dart';
import 'package:uzuo/mine/pages/v_image_picker.dart';
import 'package:uzuo/utils/decoration.dart';
import 'package:uzuo/utils/style.dart';
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

  final List<GalleryItem> _galleryItems = [];

  final _picker = ImagePicker();

  String? title;

  @override
  void initState() {
    _titelController.addListener(() {
      title = _titelController.text;
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
              if (index == _galleryItems.length) {
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
                return ImagePicked(
                  gallery: _galleryItems[index],
                  onTap: (view) {
                    _previewStart(view.gallery);
                  },
                );
              }
            }, childCount: _galleryItems.length + 1),
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

  Future<void> pickerImages(BuildContext context) async {
    try {
      final List<XFile>? pickedFiles =
          await _picker.pickMultiImage();
      setState(() {
        pickedFiles?.forEach((element) {
          GalleryItem item = GalleryItem(type: GalleryType.XFile, xFile: element);
          _galleryItems.add(item);
        });
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
                style: SureButtonStyle,
                child: Text(
                  '确定',
                  style: TextStyleTitle,
                ),
              ),
            ],
          );
        });
  }

  // 预览图片
  void _previewStart(GalleryItem allery) async {
    int currentIndex = _galleryItems.indexOf(allery) ?? 0;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImagePreview(
            galleryItems: _galleryItems,
            initialIndex: currentIndex,
            scrollDirection: Axis.horizontal,
            editerExplain: true,
            editerComplete: (bool success){
              setState(() {
              });
            },
          ),
        ));
  }
}
