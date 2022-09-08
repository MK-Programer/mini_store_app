import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../resources/font_manager.dart';
import '../resources/string_manager.dart';
import '../resources/values_manager.dart';
import '../services/utils.dart';

import '../resources/color_manager.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final productId = ModalRoute.of(context)!.settings.arguments as int;
    final productsProvider = Provider.of<ProductsProvider>(context);
    final currentProduct = productsProvider.findProdById(productId: productId);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppMargin.m18),
              const BackButton(),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${currentProduct.category!.name}',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: AppMargin.m18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: AppSize.s3.toInt(),
                          child: Text(
                            '${currentProduct.title}',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Flexible(
                          flex: AppSize.s1.toInt(),
                          child: RichText(
                            text: TextSpan(
                              text: AppStrings.dollarSign,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontSize: FontSize.s20,
                                  ),
                              children: [
                                TextSpan(
                                  text: ' ${currentProduct.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        fontSize: FontSize.s24,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppMargin.m18,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * AppMargin.m0_4,
                child: Swiper(
                  autoplay: true,
                  itemCount: currentProduct.images!.length,
                  itemBuilder: (context, index) {
                    return FancyShimmerImage(
                      imageUrl: currentProduct.images![index],
                      boxFit: BoxFit.fill,
                    );
                  },
                  pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: ColorManager.white,
                      activeColor: ColorManager.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppMargin.m18,
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.description.localize(context),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: AppMargin.m10,
                    ),
                    Text(
                      '${currentProduct.description}',
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: FontSize.s18,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
