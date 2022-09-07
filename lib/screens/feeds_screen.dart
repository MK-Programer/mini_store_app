import 'package:flutter/material.dart';
import 'package:mini_store_app/resources/font_manager.dart';
import 'package:mini_store_app/resources/values_manager.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../services/error_handler.dart';
import '../widgets/feeds_grid.dart';

import '../resources/string_manager.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  late int limit;
  late int productsCount;
  late int currentLimit;
  bool _isLoading = false;
  bool _isLimit = false;
  final ScrollController _scrollController = ScrollController();
  String errorText = '';

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  Future<void> getProducts() async {
    try {
      setState(() => _isLimit = false);
      productsCount = Provider.of<ProductsProvider>(context, listen: false)
          .getProductsCount;
      currentLimit =
          Provider.of<ProductsProvider>(context, listen: false).getLimit;
      if (currentLimit < productsCount) {
        int diff = productsCount - currentLimit;
        if (diff >= AppSize.s10) {
          //* I want to take only 10 */
          limit = currentLimit + AppSize.s10.toInt();
        } else {
          limit = diff;
        }
      } else {
        setState(() => _isLimit = true);
        return;
      }
      await Provider.of<ProductsProvider>(context, listen: false).fetchProducts(
        offset: "$currentLimit",
        limit: "$limit",
      );
    } catch (error) {
      Failure failure = handleError(int.parse(error.toString()));
      setState(() =>
          errorText = '${AppStrings.anErrorOccurred}, ${failure.message}');
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _scrollController.addListener(() async {
      //* Suppose that there is an api that provides me the count of products */
      // if (limit >= 10) {
      //   setState(() {
      //     _isLimit = true;
      //   });
      //   return;
      // }
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          _isLoading = true;
          // limit += 10;
        });
        // log("Limit $limit");
        await getProducts();
        setState(() => _isLoading = false);
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.allProducts),
      ),
      body: errorText != ''
          ? Center(
              child: Text('${AppStrings.anErrorOccurred}, $errorText'),
            )
          : SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const FeedsGrid(isInMain: false),
                  Visibility(
                    visible: _isLoading || _isLimit,
                    child: Center(
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : Visibility(
                              visible: _isLimit,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: AppPadding.p16),
                                child: Text(
                                  AppStrings.noMoreProductsFound,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        fontSize: FontSize.s20,
                                      ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
