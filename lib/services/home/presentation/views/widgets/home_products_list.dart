import 'package:flutter/material.dart';
import 'package:vision_tech/services/home/data/product_model.dart';
import 'package:vision_tech/services/home/presentation/views/widgets/product_card_item.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (BuildContext context, int index) {
        final productModel = products[index];
        return ProductCard(productModel: productModel);
      },
      itemCount: products.length,
    );
  }
}
