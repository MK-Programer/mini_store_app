import 'package:flutter/material.dart';

import '../resources/string_manager.dart';
import '../resources/values_manager.dart';
import '../services/utils.dart';
import '../widgets/feeds_widget.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.allProducts),
      ),
      body: GridView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const FeedsWidget();
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: AppSize.s2.toInt(),
          crossAxisSpacing: AppMargin.m0,
          mainAxisSpacing: AppMargin.m0,
          childAspectRatio: size.width / (size.height * AppSize.s0_7),
        ),
      ),
    );
  }
}
