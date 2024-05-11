import 'package:bloc/bloc.dart';
import 'package:mobile_app/dashboard/modules/Cart/Controller/cart_state.dart';

class CartCUbit extends Cubit<CartState> {
  CartCUbit() : super(CartInitial());
}
