import 'dart:async';

import 'package:flutter_boilerplate/api_urls.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_boilerplate/models/product_model.dart';

class ProductsService {
  Future<List<Product>?> fetchAllProducts() async {
    try {
      final response = await http.get(Uri.parse(APIUrls.getAllProducts));
      if (response.statusCode == 200) {
        final products = productsFromJson(response.body).products;
        return products;
      } else {
        throw Exception('Failed to load products with status code ${response.statusCode} and body ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
