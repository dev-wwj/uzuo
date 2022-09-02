import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uzuo/common/image_preview.dart';
import 'package:uzuo/utils/style.dart';

class AddWidget extends StatelessWidget {
  final GestureTapCallback? onTap;

  const AddWidget({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: const Color(0xFFBFBFBF))),
        alignment: Alignment.center,
        child: Image.asset('icon_add'.locImage(), width: 25),
      ),
    );
  }
}

class ImagePicked extends StatelessWidget {
  const ImagePicked({Key? key, required this.gallery, this.onTap})
      : super(key: key);

  final GalleryItem gallery;
  final Function(ImagePicked view)? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!(this);
        }
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.file(
            File(gallery.resource),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            width: double.infinity,
            height: 15,
            color: Colors.black26,
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 2),
            child: Text(
              gallery.exp,
              style: TextStyleMediumWhite,
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }
}
