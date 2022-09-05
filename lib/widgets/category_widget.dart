import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_store_app/models/categories_model.dart';
import 'package:provider/provider.dart';
import '../services/utils.dart';

import '../resources/color_manager.dart';
import '../resources/icon_manager.dart';
import '../resources/values_manager.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final categoriesModel = Provider.of<CategoriesModel>(context);
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s12),
            child: FancyShimmerImage(
              height: size.width * AppSize.s0_45,
              width: size.width * AppSize.s0_45,
              imageUrl: categoriesModel.image!,
              errorWidget: const Icon(
                IconManager.dangerBold,
                color: ColorManager.red,
                size: AppSize.s20,
              ),
              boxFit: BoxFit.cover,
            ),
          ),
          Center(
            child: Text(
              categoriesModel.name!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    backgroundColor:
                        ColorManager.lightCardColor.withOpacity(AppSize.s0_5),
                  ),
            ),
          )
        ],
      ),
    );
  }
}
