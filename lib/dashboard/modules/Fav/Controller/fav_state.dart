import 'package:mobile_app/dashboard/modules/Cart/Model/cart_model.dart';

class FavState {
  final int counter;
  final int quantity;
  final double totalPrice;
  final List<Cart> cart;

  FavState({
    required this.counter,
    required this.quantity,
    required this.totalPrice,
    required this.cart,
  });

  FavState copyWith({
    int? counter,
    int? quantity,
    double? totalPrice,
    List<Cart>? cart,
  }) {
    return FavState(
      counter: counter ?? this.counter,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      cart: cart ?? this.cart,
    );
  }
}
