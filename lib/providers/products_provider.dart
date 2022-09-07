// import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mini_store_app/resources/values_manager.dart';
import '../models/products_model.dart';
// import 'package:http/http.dart' as http;

import '../services/api_handler.dart';

class ProductsProvider with ChangeNotifier {
  static List<ProductModel> productsList = [];
  static int productsCount = AppSize.s18.toInt();
  int offset = 0;
  int limit = 0;

  List<ProductModel> get getProducts {
    return productsList;
  }

  int get getProductsCount {
    return productsCount;
  }

  int get getLimit {
    return limit;
  }

  int get getOffset {
    return offset;
  }

  Future<void> fetchProducts(
      {required String offset, required String limit}) async {
    var data = await APIHandler.getData(
      target: 'products',
      offset: offset,
      limit: limit,
    );
    for (var item in data) {
      // var images = item['images'].cast<String>();
      // for (int i = 0; i < images.length; i++) {
      //   final response = await http.get(Uri.parse(images[i]));
      //   if (response.statusCode >= 400 && response.statusCode <= 500) {
      //     log(item['id']);
      //     break;
      //   }
      //   print(item['id']);
      productsList.add(ProductModel.fromJson(item));
    }
    this.offset = int.parse(offset);
    this.limit += int.parse(limit);
    // print(this.limit);
    notifyListeners();
  }

  ProductModel findProdById({
    required int productId,
  }) {
    return productsList.firstWhere((element) => element.id == productId);
  }
}
