import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:mini_store_app/services/error_handler.dart';
import '../services/api_consts.dart';

class APIHandler {
  static Future<dynamic> getData(
      {required String target, String? offset, String? limit}) async {
    try {
      var uri = Uri.https(
          APIConsts.BASE_URL,
          '${APIConsts.UNENCODED_PATH}$target',
          target == 'products'
              ? {
                  'offset': offset,
                  'limit': limit,
                }
              : {});
      var response = await http.get(uri);
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data['statusCode'];
      }
      return data;
    } catch (error) {
      throw ResponseCode.DEFAULT;
    }
  }
}
