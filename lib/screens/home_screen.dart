import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mini_store_app/resources/color_manager.dart';
import 'package:mini_store_app/resources/font_manager.dart';
import 'package:mini_store_app/resources/icon_manager.dart';
import 'package:mini_store_app/resources/string_manager.dart';
import 'package:mini_store_app/resources/values_manager.dart';
import 'package:mini_store_app/services/utils.dart';

import '../widgets/appbar_icons.dart';
import '../widgets/feeds_widget.dart';
import '../widgets/onsale_widget.dart';
import '../widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchEditingController;

  @override
  void initState() {
    _searchEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextWidget(
            text: AppStrings.home,
            textSize: AppSize.s20,
            fontWeight: FontWeightManager.medium,
          ),
          leading: AppBarIcons(
            function: () {},
            icon: IconManager.categoryBold,
          ),
          actions: [
            AppBarIcons(
              function: () {},
              icon: IconManager.user3Bold,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            children: [
              const SizedBox(height: AppMargin.m18),
              TextField(
                controller: _searchEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: AppStrings.search,
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s10),
                    borderSide: BorderSide(
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s10),
                    borderSide: BorderSide(
                      width: AppSize.s1,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  suffixIcon: const Icon(
                    IconManager.searchLight,
                    color: ColorManager.lightIconsColor,
                  ),
                ),
              ),
              const SizedBox(height: AppMargin.m16),
              SizedBox(
                height: size.height * AppSize.s0_25,
                child: Swiper(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const OnSaleWidget();
                  },
                  pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      activeColor: ColorManager.red,
                      color: ColorManager.white,
                    ),
                  ),
                  autoplay: true,
                ),
              ),
              const FeedsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
