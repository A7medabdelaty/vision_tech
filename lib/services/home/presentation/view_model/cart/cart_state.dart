import 'package:vision_tech/services/home/data/cart_item.dart';

abstract class CartState {}

final class CartInitial extends CartState {}

final class CartItemAdded extends CartState {
  final List<CartItem> cartItems;

  CartItemAdded(this.cartItems);
}

final class CartItemRemoved extends CartState {
  final List<CartItem> cartItems;

  CartItemRemoved(this.cartItems);
}
