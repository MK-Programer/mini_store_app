import 'package:flutter/material.dart';
import 'package:mini_store_app/resources/color_manager.dart';
import 'package:mini_store_app/resources/font_manager.dart';
import 'package:mini_store_app/resources/values_manager.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final FontWeight fontWeight;
  final int maxLines;
  TextOverflow? overflow;
  TextWidget({
    Key? key,
    required this.text,
    this.color = ColorManager.blackColor,
    this.textSize = AppSize.s14,
    this.fontWeight = FontWeightManager.normal,
    this.maxLines = 10,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: textSize,
        fontWeight: fontWeight,
        overflow: overflow,
      ),
      maxLines: maxLines,
    );
  }
}
