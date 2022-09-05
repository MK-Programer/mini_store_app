import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:mini_store_app/services/api_consts.dart';

class APIHandler {
  static Future<dynamic> getAllProducts() async {
    var uri = Uri.https(APIConsts.BASE_URL, 'api/v1/products/');
    var response = await http.get(uri);
    // log('response ${jsonDecode(response.body)}');
    var data = jsonDecode(response.body);

    return data;
  }
}
