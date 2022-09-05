import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mini_store_app/resources/color_manager.dart';
import 'package:mini_store_app/resources/icon_manager.dart';
import 'package:mini_store_app/resources/route_manager.dart';
import 'package:mini_store_app/resources/string_manager.dart';
import 'package:mini_store_app/resources/values_manager.dart';
import 'package:mini_store_app/services/utils.dart';
import 'package:mini_store_app/widgets/feeds_grid.dart';
import '../widgets/appbar_icons.dart';
import '../widgets/onsale_widget.dart';

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
          title: const Text(AppStrings.home),
          leading: AppBarIcons(
            function: () {
              Navigator.pushNamed(
                context,
                Routes.categoriesRoute,
              );
            },
            icon: IconManager.categoryBold,
          ),
          actions: [
            AppBarIcons(
              function: () {
                Navigator.pushNamed(context, Routes.usersRoute);
              },
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
                style: Theme.of(context).textTheme.displaySmall,
                controller: _searchEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: AppStrings.search,
                  hintStyle: TextStyle(color: ColorManager.grey),
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                      Row(
                        children: [
                          Text(
                            AppStrings.latestProducts,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const Spacer(),
                          AppBarIcons(
                            function: () {
                              Navigator.pushNamed(context, Routes.feedsRoute);
                            },
                            icon: IconManager.arrowRight2Bold,
                          ),
                        ],
                      ),
                      const FeedsGrid(isInMain: true),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
