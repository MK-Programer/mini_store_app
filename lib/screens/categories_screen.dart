import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import '../providers/categories_provider.dart';
import '../resources/string_manager.dart';
import 'package:provider/provider.dart';

import '../resources/values_manager.dart';
import '../widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    final categoriesList = categoriesProvider.getCategoriesList;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.categories.localize(context)),
      ),
      body: categoriesList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: categoriesList[index],
                  child: const CategoryWidget(),
                );
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
