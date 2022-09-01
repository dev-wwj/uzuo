import 'package:flutter/material.dart';
import 'package:uzuo/utils/decoration.dart';
import 'package:uzuo/utils/style.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, this.readOnly = false, this.hint, this.onTap})
      : super(key: key);

  final bool readOnly;
  final String? hint;
  final GestureTapCallback? onTap;

  @override
  State<StatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      color: Color_Content_Bg,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 44,
        child: Center(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  width: 23,
                  height: 23,
                  child: Image.asset('images/icon_search.png'),
                ),
              ),
              Expanded(
                  child: TextFormField(
                readOnly: widget.readOnly,
                onTap: widget.onTap,
                decoration: WInputDecoration.inputDecoration(
                    widget.hint, TextStyleHint),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
