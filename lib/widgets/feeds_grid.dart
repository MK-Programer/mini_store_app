import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products_model.dart';
import '../providers/products_provider.dart';
import '../resources/values_manager.dart';
import '../services/utils.dart';
import 'feeds_widget.dart';

class FeedsGrid extends StatelessWidget {
  final bool isInMain;
  const FeedsGrid({
    Key? key,
    required this.isInMain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;

    final productsProvider = Provider.of<ProductsProvider>(context);
    final List<ProductModel> productsList = productsProvider.getProducts;
    return productsList.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:
                productsList.length > 4 && isInMain ? 4 : productsList.length,
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
          );
  }
}
