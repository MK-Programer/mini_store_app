import 'package:flutter/cupertino.dart';
import '../models/categories_model.dart';
import '../services/api_handler.dart';

class CategoriesProvider with ChangeNotifier {
  static List<CategoryModel> categoriesList = [];
  List<CategoryModel> get getCategoriesList {
    return categoriesList;
  }

  Future<void> fetchCategories() async {
    var data = await APIHandler.getData(target: 'categories');
    for (var item in data) {
      categoriesList.add(CategoryModel.fromJson(item));
    }
    notifyListeners();
  }
}
