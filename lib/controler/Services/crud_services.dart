import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:blog_explorer/controler/Services/api.dart';
import 'package:http/http.dart' as http;

class CRUDServices {
  static Future getBlogData() async {
    final api = Uri.parse(API.blogs);
    try {
      var response = await http.get(api, headers: {
        'Content-Type': 'application/json',
        'x-hasura-admin-secret':
            '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6'
      }).timeout(const Duration(seconds: 60), onTimeout: () {
        throw TimeoutException('Connection Timed out');
      });

      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        log(decodedResponse.toString());
        List<dynamic> products = decodedResponse['blogs'] as List<dynamic>;
        return products;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
