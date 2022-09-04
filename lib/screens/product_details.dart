import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_store_app/resources/font_manager.dart';
import 'package:mini_store_app/resources/string_manager.dart';
import 'package:mini_store_app/resources/values_manager.dart';
import 'package:mini_store_app/services/utils.dart';

import '../resources/color_manager.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
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
                      'Category',
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
                            'Lorem Ipsum',
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
                                  text: '168.00',
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
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return FancyShimmerImage(
                      imageUrl: 'https://placeimg.com/640/480/any',
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
                      AppStrings.description,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: AppMargin.m10,
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
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
