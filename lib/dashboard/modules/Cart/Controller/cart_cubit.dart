import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:mobile_app/dashboard/modules/Cart/Controller/cart_state.dart';
import 'package:mobile_app/dashboard/modules/Cart/Model/cart_model.dart';
import 'package:mobile_app/dashboard/modules/users/model/Entity_model/Product_model.dart';
import 'package:mobile_app/dashboard/modules/users/model/repo/DBHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartCubit extends Cubit<CartState> {
  final DBHelper dbHelper = DBHelper();

  CartCubit()
      : super(CartState(cart: [], quantity: 1, counter: 0, totalPrice: 0)) {
    _getPrefsItems();
  }

  void saveData(List<ProductModel> products, int index) async {
    final product = products[index];
    dbHelper
        .insert(
          Cart(
            id: index,
            productId: index.toString(),
            productName: product.model,
            initialPrice: product.price,
            productPrice: (product.discount ?? product.price) as int,
            quantity: 1,
            image: "assets//images//login.png",
          ),
        )
        .then((value) {
      addCounter();
      log('Product Added to cart');
      getData();
    }).onError((error, stackTrace) {
      log(error.toString());
    });
  }

  Future<Uint8List?> _loadImageBytes(String imagePath) async {
    File imageFile = File(imagePath);
    if (imageFile.existsSync()) {
      Uint8List bytes = await imageFile.readAsBytes();
      return bytes;
    }
    return null;
  }

  void getData() async {
    final cart = await dbHelper.getCartList();
    emit(state.copyWith(cart: cart));
  }

  void _setPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('cart_items', state.counter);
    await prefs.setInt('item_quantity', state.quantity);
    await prefs.setDouble('total_price', state.totalPrice);
  }

  void _getPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('cart_items') ?? 0;
    int quantity = prefs.getInt('item_quantity') ?? 1;
    double totalPrice = prefs.getDouble('total_price') ?? 0;
    emit(state.copyWith(
        counter: counter, quantity: quantity, totalPrice: totalPrice));
  }

  void addCounter() {
    emit(state.copyWith(counter: state.counter + 1));
    _setPrefsItems();
  }

  void removeCounter() {
    emit(state.copyWith(counter: state.counter - 1));
    _setPrefsItems();
  }

  void addQuantity(int id) {
    final index = state.cart.indexWhere((element) => element.id == id);
    if (index != -1) {
      final newCart = List<Cart>.from(state.cart);
      newCart[index].quantity += 1;
      emit(state.copyWith(cart: newCart));
      _setPrefsItems();
    }
  }

  void deleteQuantity(int id) {
    final index = state.cart.indexWhere((element) => element.id == id);
    if (index != -1 && state.cart[index].quantity > 1) {
      final newCart = List<Cart>.from(state.cart);
      newCart[index].quantity -= 1;
      emit(state.copyWith(cart: newCart));
      _setPrefsItems();
    }
  }

  void removeItem(int id) {
    final newCart = List<Cart>.from(state.cart);
    newCart.removeWhere((element) => element.id == id);
    emit(state.copyWith(cart: newCart));
    _setPrefsItems();
  }

  void addTotalPrice(double productPrice) {
    emit(state.copyWith(totalPrice: state.totalPrice + productPrice));
    _setPrefsItems();
  }

  void removeTotalPrice(double productPrice) {
    emit(state.copyWith(totalPrice: state.totalPrice - productPrice));
    _setPrefsItems();
  }
}
