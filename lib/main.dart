import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_store_app/resources/route_manager.dart';
import 'package:mini_store_app/resources/theme_manager.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Store APP',
      theme: ThemeManager.themeData(),
      initialRoute: Routes.homeRoute,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
