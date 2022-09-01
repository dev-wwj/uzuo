import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzuo/utils/style.dart';
import 'package:image_picker/image_picker.dart';

class CoverPicker extends StatefulWidget {
  CoverPicker({super.key, this.resource});
  late ImageProvider? resource;
  @override
  State<StatefulWidget> createState() => _CoverPickerState();
}

class _CoverPickerState extends State<CoverPicker> {
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return widget.resource != null
        ? Ink.image(
            image: widget.resource!,
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
            child: InkWell(
              onTap: () {
                pickerImages(context, ImageSource.gallery);
              },
              child: _addWidget(),
            ),
          )
        : Ink(
            color: Color_Content_Bg,
            child: InkWell(
              onTap: () {
                pickerImages(context, ImageSource.gallery);
              },
              child: _addWidget(),
            ),
          );
  }

  Widget _addWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'icon_add'.locImage(),
            width: 25,
            height: 25,
          ),
          const SizedBox(height: 14.5),
          Text(
            '上传封面',
            style: TextStyleMajor,
          ),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant CoverPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  Future<void> pickerImages(BuildContext context, ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      setState(() {
        widget.resource = FileImage(File(pickedFile!.path));
      });
    } catch (e) {
      setState(() {
        //TODO: error;
      });
    }
  }
}
