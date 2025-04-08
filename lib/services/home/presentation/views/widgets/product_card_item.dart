import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_tech/services/home/data/cart_item.dart';
import 'package:vision_tech/services/home/presentation/view_model/cart/cart_cubit.dart';
import 'package:vision_tech/services/home/presentation/views/cart/cart_view.dart';
import 'package:vision_tech/services/home/presentation/views/product_details/product_details_view.dart';

import '../../../data/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product productModel;

  const ProductCard({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.routeName,
          arguments: productModel,
        );
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                productModel.imageUrl,
                height: 0.2.sh,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${productModel.price.toStringAsFixed(1)} EGP',
                    style: TextStyle(fontSize: 14.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18.sp),
                      const SizedBox(width: 4),
                      Text(
                        productModel.rate.toString(),
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff220A0A),
                          ),
                        ),
                        onPressed: () {
                          final cartCubit = context.read<CartCubit>();
                          final cartItem = CartItem(
                            product: productModel,
                            quantity: 1,
                          );
                          cartCubit.addItemToCart(cartItem);
                          Navigator.pushNamed(context, CartView.routeName);
                        },
                        child: Text(
                          'أضف إلي السلة',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
