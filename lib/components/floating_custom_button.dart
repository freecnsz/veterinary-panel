import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/product_service/providers/product_provider.dart';

class FloatingCustomButton extends StatelessWidget {
  const FloatingCustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Call the fetchProducts method on the provider to load the data
        Provider.of<ProductProvider>(context, listen: false).fetchProducts();
      },
      child: const Icon(Icons.refresh),
    );
  }
}
