import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_tech/services/home/presentation/view_model/cart/cart_cubit.dart';
import 'package:vision_tech/services/home/presentation/views/checkout/checkout_view.dart';

import '../../view_model/cart/cart_state.dart';

class CartView extends StatefulWidget {
  static const String routeName = 'cartScreen';

  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        CartCubit cubit = BlocProvider.of<CartCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Your Cart"),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black87,
            elevation: 1,
          ),
          body:
              cubit.cartItems.isEmpty
                  ? const Center(child: Text("Your cart is empty"))
                  : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: cubit.cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cubit.cartItems[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              child: ListTile(
                                leading: Image.asset(
                                  item.product.imageUrl,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(item.product.title),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${item.product.price.toStringAsFixed(2)} EGP',
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed:
                                              () => cubit.decreaseItemQuantity(
                                                item,
                                              ),
                                        ),
                                        Text(item.quantity.toString()),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed:
                                              () => cubit.addItemToCart(item),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed:
                                      () => cubit.removeItemFromCart(item),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // Total price
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, -2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total:",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${cubit.totalPrice.toStringAsFixed(2)} EGP',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    CheckoutView.routeName,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                                child: const Text(
                                  'إتمام الطلب',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
        );
      },
    );
  }
}
