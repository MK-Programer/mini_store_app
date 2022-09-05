import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../providers/categories_provider.dart';
import '../providers/products_provider.dart';
import '../providers/users_provider.dart';
import '../resources/route_manager.dart';
import '../resources/theme_manager.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mini Store APP',
        theme: ThemeManager.themeData(),
        initialRoute: Routes.fetchRoute,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}
