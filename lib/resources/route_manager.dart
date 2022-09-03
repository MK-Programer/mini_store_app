import 'package:flutter/material.dart';
import 'package:mini_store_app/resources/string_manager.dart';
import 'package:mini_store_app/screens/home_screen.dart';
import 'package:mini_store_app/widgets/text_widget.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/feeds_screen.dart';

class Routes {
  static const String homeRoute = '/HomeScreen';
  static const String feedsRoute = '/FeedsScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.feedsRoute:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const FeedsScreen(),
        );
      case Routes.homeRoute:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const HomeScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return PageTransition(
        child: Scaffold(
          body: Center(
            child: TextWidget(
              text: AppStrings.noRouteFound,
            ),
          ),
        ),
        type: PageTransitionType.fade);
  }
}
