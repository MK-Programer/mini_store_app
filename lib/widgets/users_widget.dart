import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_store_app/resources/font_manager.dart';

import '../resources/color_manager.dart';
import '../resources/icon_manager.dart';
import '../resources/values_manager.dart';
import '../services/utils.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;

    return ListTile(
      leading: FancyShimmerImage(
        height: size.width * AppSize.s0_15,
        width: size.width * AppSize.s0_15,
        imageUrl: 'https://placeimg.com/640/480/any',
        errorWidget: const Icon(
          IconManager.dangerBold,
          color: ColorManager.red,
          size: AppSize.s20,
        ),
        boxFit: BoxFit.fill,
      ),
      title: Text(
        'User name',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      subtitle: Text(
        'Email@email.com',
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontSize: FontSize.s14,
              fontWeight: FontWeightManager.normal,
            ),
      ),
      trailing: const Text(
        'User role',
        style: TextStyle(
          color: ColorManager.lightIconsColor,
          fontWeight: FontWeightManager.bold,
        ),
      ),
    );
  }
}
