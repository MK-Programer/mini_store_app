import 'package:flutter/cupertino.dart';
import '../models/users_model.dart';

import '../services/api_handler.dart';

class UsersProvider with ChangeNotifier {
  static List<UserModel> usersList = [];
  List<UserModel> get getUsers {
    return usersList;
  }

  Future<void> fetchUsers() async {
    var data = await APIHandler.getData(target: 'users');
    for (var item in data) {
      usersList.add(UserModel.fromJson(item));
    }
    notifyListeners();
  }
}
