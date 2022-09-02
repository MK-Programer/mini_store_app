import 'package:flutter/material.dart';
import 'package:mini_store_app/resources/icon_manager.dart';
import 'package:mini_store_app/resources/string_manager.dart';

import '../widgets/appbar_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          AppBarIcons(
            function: () {},
            icon: IconManager.categoryIcon,
          ),
        ],
      ),
    );
  }
}
