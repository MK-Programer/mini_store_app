import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:mini_store_app/resources/string_manager.dart';
import '../resources/values_manager.dart';
import '../services/utils.dart';

import '../resources/color_manager.dart';

class OnSaleWidget extends StatelessWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Container(
      width: double.infinity,
      height: size.height * AppSize.s0_2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s18),
        gradient: const LinearGradient(
          colors: [
            ColorManager.royalPurple,
            ColorManager.darkSkyBlue,
          ],
          begin: FractionalOffset(AppSize.s0, AppSize.s0),
          end: FractionalOffset(
            AppSize.s1,
            AppSize.s0,
          ),
          stops: [AppSize.s0, AppSize.s1],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Row(
        children: [
          Flexible(
            flex: AppSize.s2.toInt(),
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: ColorManager.ceil,
                  borderRadius: BorderRadius.circular(AppSize.s18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.getTheSpecialDiscount.localize(context),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: AppMargin.m18),
                      Flexible(
                        child: SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              '50%\n${AppStrings.off.localize(context)}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: AppSize.s3.toInt(),
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: Image.network(
                width: double.infinity,
                'https://i.ibb.co/vwB46Yq/shoes.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
