import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_store_app/models/users_model.dart';
import 'package:provider/provider.dart';
import '../resources/font_manager.dart';

import '../resources/color_manager.dart';
import '../resources/icons_manager.dart';
import '../resources/values_manager.dart';
import '../services/utils.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final usersModel = Provider.of<UserModel>(context);
    return ListTile(
      leading: FancyShimmerImage(
        height: size.width * AppSize.s0_15,
        width: size.width * AppSize.s0_15,
        imageUrl: usersModel.avatar.toString(),
        errorWidget: const Icon(
          IconManager.dangerBold,
          color: ColorManager.red,
          size: AppSize.s20,
        ),
        boxFit: BoxFit.fill,
      ),
      title: Text(
        usersModel.name.toString(),
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      subtitle: Text(
        usersModel.email.toString(),
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontSize: FontSize.s14,
              fontWeight: FontWeightManager.normal,
            ),
      ),
      trailing: Text(
        usersModel.role.toString(),
        style: const TextStyle(
          color: ColorManager.lightIconsColor,
          fontWeight: FontWeightManager.bold,
        ),
      ),
    );
  }
}
