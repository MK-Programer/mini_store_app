import 'package:flutter/cupertino.dart';
import 'package:mini_store_app/models/products_model.dart';

import '../services/api_handler.dart';

class ProductsProvider with ChangeNotifier {
  static List<ProductsModel> _productsList = [];
  List<ProductsModel> get getProducts {
    return _productsList;
  }

  Future<void> fetchProducts() async {
    var data = await APIHandler.getAllProducts();
    for (var item in data) {
      _productsList.add(ProductsModel.fromJson(item));
    }
    notifyListeners();
  }
}
