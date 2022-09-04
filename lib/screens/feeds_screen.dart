import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products_model.dart';
import '../providers/products_provider.dart';
import '../resources/string_manager.dart';
import '../resources/values_manager.dart';
import '../services/utils.dart';
import '../widgets/feeds_widget.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final productsProvider = Provider.of<ProductsProvider>(context);
    final List<ProductsModel> productsList = productsProvider.getProducts;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.allProducts),
      ),
      body: productsList.isEmpty
          ? Container()
          : GridView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: productsList[index],
                  child: const FeedsWidget(),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: AppSize.s2.toInt(),
                crossAxisSpacing: AppMargin.m0,
                mainAxisSpacing: AppMargin.m0,
                childAspectRatio: size.width / (size.height * AppSize.s0_8),
              ),
            ),
    );
  }
}
