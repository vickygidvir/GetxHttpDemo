import 'dart:developer';

import 'package:cosmoapp/model/product.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();
  

  static Future<List<Product>> fetchProducts() async {
    var response = await client.get('https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie');

          
    log("------LOG------RESPONSE------$response");

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    }

  

  }
}
