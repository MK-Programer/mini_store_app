import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/categories_provider.dart';
import 'providers/products_provider.dart';
import 'resources/route_manager.dart';

class FetchDataScreen extends StatefulWidget {
  const FetchDataScreen({Key? key}) : super(key: key);

  @override
  State<FetchDataScreen> createState() => _FetchDataScreenState();
}

class _FetchDataScreenState extends State<FetchDataScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () async {
        setState(() => _isLoading = true);
        await getAllCategories();
        await getAllProducts();
        setState(() => _isLoading = false);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(
          context,
          Routes.homeRoute,
        );
      },
    );

    super.initState();
  }

  Future<void> getAllCategories() async {
    await Provider.of<CategoriesProvider>(context, listen: false)
        .fetchCategories();
  }

  Future<void> getAllProducts() async {
    await Provider.of<ProductsProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const SizedBox(),
    );
  }
}
