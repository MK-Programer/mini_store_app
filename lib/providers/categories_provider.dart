import 'package:flutter/cupertino.dart';
import 'package:mini_store_app/models/categories_model.dart';
import 'package:mini_store_app/services/api_handler.dart';

class CategoriesProvider with ChangeNotifier {
  static List<CategoriesModel> categoriesList = [];
  List<CategoriesModel> get getCategoriesList {
    return categoriesList;
  }

  Future<void> fetchCategories() async {
    var data = await APIHandler.getData(target: 'categories');
    for (var item in data) {
      categoriesList.add(CategoriesModel.fromJson(item));
    }
    notifyListeners();
  }
}
