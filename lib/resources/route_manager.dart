import 'package:flutter/material.dart';
import '../resources/string_manager.dart';
import '../screens/home_screen.dart';
import '../screens/product_details.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/feeds_screen.dart';

class Routes {
  static const String homeRoute = '/HomeScreen';
  static const String feedsRoute = '/FeedsScreen';
  static const String productDetailsRoute = '/ProductDetailsScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const HomeScreen(),
        );
      case Routes.feedsRoute:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const FeedsScreen(),
        );
      case Routes.productDetailsRoute:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const ProductDetailsScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return PageTransition(
      child: const Scaffold(
        body: Center(
          child: Text(
            AppStrings.noRouteFound,
          ),
        ),
      ),
      type: PageTransitionType.fade,
    );
  }
}
