import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import '../models/products_model.dart';
import '../resources/icon_manager.dart';
import '../resources/route_manager.dart';
import '../resources/string_manager.dart';
import '../resources/values_manager.dart';
import '../services/utils.dart';
import 'package:provider/provider.dart';

import '../resources/color_manager.dart';

class FeedsWidget extends StatelessWidget {
  const FeedsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final productsModel = Provider.of<ProductModel>(context);
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p2),
      child: Material(
        borderRadius: BorderRadius.circular(AppSize.s8),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.productDetailsRoute,
              arguments: productsModel.id,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p5,
                  right: AppPadding.p5,
                  top: AppPadding.p8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          text: AppStrings.dollarSign,
                          style: Theme.of(context).textTheme.labelMedium,
                          children: [
                            TextSpan(
                              text: '${productsModel.price}',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Icon(IconManager.heartBold),
                  ],
                ),
              ),
              const SizedBox(height: AppMargin.m10),
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s12),
                child: FancyShimmerImage(
                  height: size.height * AppSize.s0_2,
                  width: double.infinity,
                  // imageUrl: productsModel.images![0] == ''
                  //     ? 'https://i.ibb.co/vwB46Yq/shoes.png'
                  //     : productsModel.images![0],
                  imageUrl: productsModel.images![0],
                  errorWidget: const Icon(
                    IconManager.dangerBold,
                    color: ColorManager.red,
                    size: AppSize.s20,
                  ),
                  boxFit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: AppMargin.m10),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Text(
                  '${productsModel.title}',
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: AppSize.s2.toInt(),
                ),
              ),
              SizedBox(height: size.height * AppSize.s0_01),
            ],
          ),
        ),
      ),
    );
  }
}
