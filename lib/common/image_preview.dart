import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:uzuo/utils/decoration.dart';
import 'package:uzuo/utils/style.dart';
import 'package:image_picker/image_picker.dart';

enum GalleryType {
  XFile,
}

class GalleryItem {
  GalleryItem({this.type = GalleryType.XFile, this.xFile});

  final GalleryType type;
  XFile? xFile;

  String? explain;
  String get exp {
    return explain ?? '添加说明';
  }

  String get resource {
    return xFile != null ? xFile!.path : '';
  }

  Object get tag {
    return xFile != null ? xFile!.name : '';
  }
}

class ImagePreview extends StatefulWidget {
  ImagePreview(
      {super.key,
      this.loadingBuilder,
      this.backgroundDecoration,
      this.minScale,
      this.maxScale,
      this.initialIndex = 0,
      required this.galleryItems,
      this.scrollDirection = Axis.horizontal,
      this.editerExplain = false,
      this.editerComplete})
      : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<GalleryItem> galleryItems;
  final Axis scrollDirection;
  final bool editerExplain;
  final Function(bool)? editerComplete;

  @override
  State<StatefulWidget> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  _ImagePreviewState();
  @override
  void dispose() {
    super.dispose();
  }

  late int currentIndex = widget.initialIndex;
  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: context.height(),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PhotoViewGallery.builder(
              itemCount: widget.galleryItems.length,
              pageController: widget.pageController,
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _buildItem,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
              loadingBuilder: (context, event) => Center(
                child: SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded /
                            (event.expectedTotalBytes)!,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.fromLTRB(20, 0, 20, context.bottomSafeMarge()),
              child: Text(
                '${widget.galleryItems[currentIndex].exp} ',
                style: TextStyle17White,
                maxLines: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final GalleryItem item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: FileImage(File(item.resource)),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: item.tag),
      onTapUp: (BuildContext context, TapUpDetails details,
          PhotoViewControllerValue controllerValue) {
        if (widget.editerExplain) {
          _onTap(index);
        }
      },
    );
  }

  void _onTap(int index) {
    final GalleryItem item = widget.galleryItems[index];
    final TextEditingController controller =
        TextEditingController(text: item.explain);
    controller.addListener(() {
      item.explain = controller.text;
      setState(() {});
    });
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              '图片介绍',
              style: TextStyleTitle,
            ),
            content: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              height: 160,
              child: TextFormField(
                maxLines: 10,
                controller: controller,
                decoration: WInputDecoration.inputDecoration(
                    '请输入图片介绍说明', TextStyleHint),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (widget.editerComplete != null) {
                    widget.editerComplete!(true);
                  }
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
}
