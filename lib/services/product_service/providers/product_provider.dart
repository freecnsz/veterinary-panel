import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/models/product_model.dart';

import '../products_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product>? products;
  bool isLoading = false;
  String? error;

  Future<void> fetchProducts() async {
    try {
      isLoading = true;
      notifyListeners();

      // Call the service to get the products
      final productService = ProductsService();
      final fetchedProducts = await productService.fetchAllProducts();

      // Update the state with the fetched products
      products = fetchedProducts;
      error = null;
    } catch (e) {
      error = 'Failed to load products: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
