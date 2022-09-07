import 'package:flutter/material.dart';
import 'package:mini_store_app/providers/users_provider.dart';
import 'package:mini_store_app/resources/values_manager.dart';
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
  String errorText = '';

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
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(
            context,
            Routes.homeRoute,
          );
        } catch (error) {
          setState(() => errorText = 'An error occurred, $error');
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
        child: _isLoading && errorText == ''
            ? const CircularProgressIndicator()
            : Text(errorText),
      ),
    );
  }
}
