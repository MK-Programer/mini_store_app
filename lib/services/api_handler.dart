import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mini_store_app/services/api_consts.dart';

class APIHandler {
  static Future<void> getAllProducts() async {
    var uri = Uri.https(APIConsts.BASE_URL, 'api/v1/products/');
    var response = await http.get(uri);
    log('response ${jsonDecode(response.body)}');
  }
}
