import 'package:flutter/material.dart';
import 'package:mini_store_app/resources/values_manager.dart';
import 'package:mini_store_app/services/utils.dart';
import 'package:mini_store_app/widgets/text_widget.dart';

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
            flex: AppSize.s2,
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
                    children: const [
                      TextWidget(
                        text: 'Get the special discount',
                      ),
                      SizedBox(height: AppMargin.m18),
                      Flexible(
                        child: SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: TextWidget(
                              text: '50%\nOFF',
                              isTitle: true,
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
            flex: AppSize.s3,
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