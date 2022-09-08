import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:mini_store_app/resources/language_manager.dart';
import '../resources/color_manager.dart';
import '../resources/icons_manager.dart';
import '../resources/route_manager.dart';
import '../resources/string_manager.dart';
import '../resources/values_manager.dart';
import '../services/utils.dart';
import '../widgets/feeds_grid.dart';
import '../widgets/appbar_icons.dart';
import '../widgets/onsale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchEditingController;
  static List<String> menuItems = [
    LanguageType.ENGLISH.getValue().toUpperCase(),
    LanguageType.ARABIC.getValue().toUpperCase(),
  ];

  final List<DropdownMenuItem<String>> dropDownMenuItems = menuItems
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: Text(
            value,
          ),
        ),
      )
      .toList();

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
    String selected = Utils(context).getCurrentLocale;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.home.localize(context)),
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
            const SizedBox(
              width: AppMargin.m8,
            ),
            DropdownButton(
              value: selected,
              items: dropDownMenuItems,
              onChanged: (value) async {
                setState(() => selected = value.toString());
                if (value == LanguageType.ENGLISH.getValue().toUpperCase()) {
                  LocaleNotifier.of(context)!
                      .change(LanguageType.ENGLISH.getValue());
                } else {
                  LocaleNotifier.of(context)!
                      .change(LanguageType.ARABIC.getValue());
                }
              },
            )
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
                  hintText: AppStrings.search.localize(context),
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
                            AppStrings.latestProducts.localize(context),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const Spacer(),
                          AppBarIcons(
                            function: () {
                              Navigator.pushNamed(context, Routes.feedsRoute);
                            },
                            icon: selected == menuItems[0] // EN
                                ? IconManager.arrowRight2Bold
                                : IconManager.arrowLeft2Bold,
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
