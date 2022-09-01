import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzuo/utils/decoration.dart';
import 'package:uzuo/utils/style.dart';

// ignore: must_be_immutable
class InfoIndicator extends StatelessWidget {
  InfoIndicator(
      {super.key,
      required this.title,
      this.value,
      this.onTap,
      this.separator = true});

  String title;
  String? value;
  bool separator;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 64,
        margin: const EdgeInsets.symmetric(horizontal: 15.5),
        decoration: separator ? BottomLineDecoration : null,
        child: Row(
          children: [
            Text(
              title,
              style: TextStyleTitle,
            ),
            const Spacer(),
            Text(
              value ?? '',
              style: TextStyleContent,
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              'icon_indicator'.locImage(),
              width: 7.5,
            )
          ],
        ),
      ),
    );
  }
}

class InfoEditor extends StatelessWidget {
  const InfoEditor(
      {super.key,
      required this.unit,
      required this.hint,
      this.value,
      this.onTap,
      this.separator = true});

  final String unit;
  final String hint;
  final String? value;
  final bool separator;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 64,
        margin: const EdgeInsets.symmetric(horizontal: 15.5),
        decoration: separator ? BottomLineDecoration : null,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                style: TextStyleTitle,
                decoration:
                    WInputDecoration.inputDecoration(hint, TextStyleHint),
                keyboardType: TextInputType.number,
                onChanged: (value) {},
              ),
            ),
            Text(
              unit ?? '',
              style: TextStyleTitle,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoImporter extends StatelessWidget {
  const InfoImporter(
      {super.key,
      required this.title,
      required this.unit,
      required this.hint,
      this.value,
      this.onTap,
      this.separator = true});

  final String title;
  final String unit;
  final String hint;
  final String? value;
  final bool separator;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15.5, vertical: 25),
        decoration: separator ? BottomLineDecoration : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyleTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    style: TextStyleTitle,
                    decoration:
                        WInputDecoration.inputDecoration(hint, TextStyleHint),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                  ),
                ),
                Text(
                  unit ?? '',
                  style: TextStyleTitle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
