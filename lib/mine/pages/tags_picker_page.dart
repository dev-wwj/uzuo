// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:uzuo/mine/model/data_work.dart';
import 'package:uzuo/utils/decoration.dart';
import 'package:uzuo/utils/style.dart';
import 'package:uzuo/views/appbar.dart';
import 'package:provider/provider.dart';

class TagsPickerPage extends StatelessWidget {
  const TagsPickerPage(
      {super.key,
      required this.title,
      required this.tags,
      required this.module});

  final String title;
  final List<String> tags;
  final WorkModule module;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title, null),
      body: _TagsPicker(
        tags: tags,
        module: module,
      ),
    );
  }
}

class _TagsPicker extends StatefulWidget {
  const _TagsPicker({required this.tags, required this.module});
  final List<String> tags;
  final WorkModule module;

  @override
  State<StatefulWidget> createState() => _TagsPickerState();
}

class _TagsPickerState extends State<_TagsPicker> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        itemCount: widget.tags.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              context
                  .read<WorkInfoModel>()
                  .set(widget.tags[index], widget.module);
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15.5),
              alignment: Alignment.centerLeft,
              height: 63,
              decoration: BottomLineDecoration,
              child: Text(
                //TODO: 选中
                widget.tags[index],
                style: TextStyleTitle,
              ),
            ),
          );
        });
  }
}
