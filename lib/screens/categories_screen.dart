import 'package:flutter/material.dart';
import 'package:mini_store_app/resources/string_manager.dart';
import 'package:mini_store_app/widgets/category_widget.dart';

import '../resources/values_manager.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.categories),
      ),
      body: GridView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const CategoryWidget();
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: AppSize.s2.toInt(),
          crossAxisSpacing: AppMargin.m0,
          mainAxisSpacing: AppMargin.m0,
          childAspectRatio: AppSize.s1_2,
        ),
      ),
    );
  }
}
