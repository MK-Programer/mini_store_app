import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:mini_store_app/resources/string_manager.dart';
import '../providers/users_provider.dart';
import '../services/error_handler.dart';
import '../resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../providers/categories_provider.dart';
import '../providers/products_provider.dart';
import '../resources/route_manager.dart';

class FetchDataScreen extends StatefulWidget {
  const FetchDataScreen({Key? key}) : super(key: key);

  @override
  State<FetchDataScreen> createState() => _FetchDataScreenState();
}

class _FetchDataScreenState extends State<FetchDataScreen> {
  bool _isLoading = false;
  String errorText = AppStrings.empty;

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () async {
        try {
          setState(() => _isLoading = true);
          await getCategories();
          await getProducts();
          await getUsers();
          setState(() => _isLoading = false);
          //*Update the push replacement to push and remove untill/
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.homeRoute,
            ModalRoute.withName(Routes.fetchRoute),
          );
        } catch (error) {
          Failure failure = handleError(int.parse(error.toString()));
          // print(failure.message);
          setState(() {
            _isLoading = false;
            errorText = failure.message;
          });
        }
      },
    );

    super.initState();
  }

  Future<void> getCategories() async {
    await Provider.of<CategoriesProvider>(context, listen: false)
        .fetchCategories();
  }

  Future<void> getProducts() async {
    int productsCount =
        Provider.of<ProductsProvider>(context, listen: false).getProductsCount;
    int initLimit = AppSize.s4.toInt();
    int initOffset = AppSize.s0.toInt();
    await Provider.of<ProductsProvider>(context, listen: false).fetchProducts(
      offset: "$initOffset",
      limit: productsCount >= initLimit ? "$initLimit" : "$productsCount",
    );
  }

  Future<void> getUsers() async {
    await Provider.of<UsersProvider>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading || errorText == AppStrings.empty
            ? const CircularProgressIndicator()
            : Text(errorText.localize(context)),
      ),
    );
  }
}
