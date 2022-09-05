import 'package:flutter/cupertino.dart';
import 'package:mini_store_app/models/products_model.dart';

import '../services/api_handler.dart';

class ProductsProvider with ChangeNotifier {
  static List<ProductsModel> productsList = [];
  List<ProductsModel> get getProducts {
    return productsList;
  }

  Future<void> fetchProducts() async {
    var data = await APIHandler.getData(target: 'products');
    for (var item in data) {
      productsList.add(ProductsModel.fromJson(item));
    }
    notifyListeners();
  }
}
