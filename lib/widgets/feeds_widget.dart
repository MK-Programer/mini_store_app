import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_store_app/resources/font_manager.dart';
import 'package:mini_store_app/resources/icon_manager.dart';
import 'package:mini_store_app/resources/values_manager.dart';
import 'package:mini_store_app/services/utils.dart';

import '../resources/color_manager.dart';

class FeedsWidget extends StatelessWidget {
  const FeedsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p2),
      child: Material(
        borderRadius: BorderRadius.circular(AppSize.s8),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {},
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
                        text: const TextSpan(
                          text: '\$',
                          style: TextStyle(
                            color: ColorManager.cyan,
                          ),
                          children: [
                            TextSpan(
                              text: '168.00',
                              style: TextStyle(
                                color: ColorManager.lightTextColor,
                                fontWeight: FontWeightManager.semiBold,
                              ),
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
                  imageUrl: 'https://i.ibb.co/vwB46Yq/shoes.png',
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
                  'Title',
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
