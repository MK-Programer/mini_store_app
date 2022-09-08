import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../resources/language_manager.dart';
import '../resources/string_manager.dart';
import '../resources/values_manager.dart';
import '../services/utils.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> menuItems = [
      AppStrings.enLang,
      AppStrings.arLang,
    ];

    final List<DropdownMenuItem<String>> dropDownMenuItems = menuItems
        .map(
          (value) => DropdownMenuItem(
            value: value,
            child: Text(
              value.localize(context),
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        )
        .toList();
    String currentLang = Utils(context).getCurrentLocale ==
            LanguageType.ENGLISH.getValue().toUpperCase()
        ? AppStrings.enLang
        : AppStrings.arLang;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.settings.localize(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    AppStrings.chooseLang.localize(context),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Expanded(
                  child: DropdownButton(
                    isExpanded: true,
                    value: currentLang,
                    items: dropDownMenuItems,
                    onChanged: (value) {
                      setState(() => currentLang = value.toString());
                      if (value == menuItems[0]) {
                        LocaleNotifier.of(context)!
                            .change(LanguageType.ENGLISH.getValue());
                      } else {
                        LocaleNotifier.of(context)!
                            .change(LanguageType.ARABIC.getValue());
                      }
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
