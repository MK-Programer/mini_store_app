// import 'dart:developer';

import 'package:flutter/cupertino.dart';
import '../models/products_model.dart';
// import 'package:http/http.dart' as http;

import '../services/api_handler.dart';

class ProductsProvider with ChangeNotifier {
  static List<ProductModel> productsList = [];
  List<ProductModel> get getProducts {
    return productsList;
  }

  Future<void> fetchProducts({
    required String limit,
  }) async {
    var data = await APIHandler.getData(
      target: 'products',
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
    notifyListeners();
  }

  ProductModel findProdById({
    required int productId,
  }) {
    return productsList.firstWhere((element) => element.id == productId);
  }
}
