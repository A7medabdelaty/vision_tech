import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_tech/services/home/data/cart_item.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<CartItem> _cartItems = [];
  int _numberOfItems = 0;
  void addItemToCart(CartItem cartItem) {
    if (_cartItems.contains(cartItem)) {
      _updateCartItemQuantity(cartItem, cartItem.quantity + 1);
    } else {
      _cartItems.add(cartItem);
    }
    _numberOfItems++;
    emit(CartItemAdded(_cartItems));
  }

  void decreaseItemQuantity(CartItem cartItem) {
    if (_cartItems.contains(cartItem)) {
      if (cartItem.quantity > 1) {
        _updateCartItemQuantity(cartItem, cartItem.quantity - 1);
      } else {
        removeItemFromCart(cartItem);
      }
    }
  }

  void removeItemFromCart(CartItem cartItem) {
    _cartItems.remove(cartItem);
    _numberOfItems--;
    emit(CartItemRemoved(_cartItems));
  }

  void clearCart() {
    _cartItems.clear();
    _numberOfItems = 0;
    emit(CartItemRemoved(_cartItems));
  }

  List<CartItem> get cartItems => _cartItems;

  double get totalPrice {
    return _cartItems.fold(0.0, (sum, item) {
      return sum + item.product.price * item.quantity;
    });
  }

  void _updateCartItemQuantity(CartItem item, int quantity) {
    final index = _cartItems.indexOf(item);
    if (index != -1) {
      _cartItems[index].quantity = quantity;
      emit(CartItemAdded(_cartItems));
    }
  }
}
