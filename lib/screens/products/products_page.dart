import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/floating_custom_button.dart';
import '../../services/product_service/providers/product_provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});
  static const String routeName = '/products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.error != null) {
            return Center(child: Text(provider.error!));
          } else if (provider.products != null) {
            // Render the product list
            return ListView.builder(
              itemCount: provider.products!.length,
              itemBuilder: (context, index) {
                final product = provider.products![index];
                return ListTile(
                  title: Text(product.title ?? ''),
                  subtitle: Text(product.description ?? ''),
                  // Add more details as needed
                );
              },
            );
          } else {
            return const Center(child: Text('No products available.'));
          }
        },
      ),
      floatingActionButton: const FloatingCustomButton(),
    );
  }
}
