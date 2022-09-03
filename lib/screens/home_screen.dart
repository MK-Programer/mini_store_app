import 'package:flutter/material.dart';
import 'package:mini_store_app/resources/color_manager.dart';
import 'package:mini_store_app/resources/icon_manager.dart';
import 'package:mini_store_app/resources/string_manager.dart';
import 'package:mini_store_app/resources/values_manager.dart';

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.home,
          ),
          leading: AppBarIcons(
            function: () {},
            icon: IconManager.categoryIcon,
          ),
          actions: [
            AppBarIcons(
              function: () {},
              icon: IconManager.user3,
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
                    IconManager.search,
                    color: ColorManager.lightIconsColor,
                  ),
                ),
              ),
              const OnSaleWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
