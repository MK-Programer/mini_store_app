import 'package:flutter/material.dart';
import 'package:mini_store_app/resources/color_manager.dart';
import 'package:mini_store_app/resources/font_manager.dart';
import 'package:mini_store_app/resources/values_manager.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final bool isTitle;
  final int maxLines;
  const TextWidget({
    Key? key,
    required this.text,
    this.color = ColorManager.white,
    this.textSize = AppSize.s14,
    this.isTitle = false,
    this.maxLines = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: textSize,
        fontWeight: isTitle ? FontWeightManager.bold : FontWeightManager.normal,
      ),
      maxLines: maxLines,
    );
  }
}
