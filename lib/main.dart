import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locales/flutter_locales.dart';
import '../providers/categories_provider.dart';
import '../providers/products_provider.dart';
import '../providers/users_provider.dart';
import '../resources/route_manager.dart';
import '../resources/theme_manager.dart';
import 'package:provider/provider.dart';

import 'resources/language_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init([ENGLISH, ARABIC]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return ProductsProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return CategoriesProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return UsersProvider();
          },
        ),
      ],
      child: LocaleBuilder(
        builder: (locale) => MaterialApp(
          localizationsDelegates: Locales.delegates,
          supportedLocales: Locales.supportedLocales,
          locale: locale,
          debugShowCheckedModeBanner: false,
          title: 'Mini Store APP',
          theme: ThemeManager.themeData(),
          initialRoute: Routes.fetchRoute,
          onGenerateRoute: RouteGenerator.getRoute,
        ),
      ),
    );
  }
}
