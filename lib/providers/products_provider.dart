import 'package:flutter/cupertino.dart';
import '../models/products_model.dart';

import '../services/api_handler.dart';

class ProductsProvider with ChangeNotifier {
  static List<ProductModel> productsList = [];
  List<ProductModel> get getProducts {
    return productsList;
  }

  Future<void> fetchProducts() async {
    var data = await APIHandler.getData(target: 'products');
    for (var item in data) {
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
