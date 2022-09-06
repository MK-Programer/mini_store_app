import 'dart:convert';
import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../services/api_consts.dart';

class APIHandler {
  static Future<dynamic> getData({
    required String target,
    String? limit,
  }) async {
    try {
      var uri = Uri.https(
          APIConsts.BASE_URL,
          '${APIConsts.UNENCODED_PATH}$target',
          target == 'products'
              ? {
                  'offset': "0",
                  'limit': limit,
                }
              : {});
      var response = await http.get(uri);
      // log('response ${jsonDecode(response.body)}');
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data['message'];
      }
      return data;
    } catch (error) {
      log('An error occuredd, $error');
      throw error.toString();
    }
  }
}
