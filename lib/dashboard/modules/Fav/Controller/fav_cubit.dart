import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:mobile_app/Database/repo/DBHelper.dart';
import 'package:mobile_app/dashboard/modules/Cart/Controller/cart_state.dart';
import 'package:mobile_app/dashboard/modules/Cart/Model/cart_model.dart';
import 'package:mobile_app/dashboard/modules/users/model/Entity_model/Product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavCubit extends Cubit<CartState> {
  DBHelper dbHelper = DBHelper();

  FavCubit()
      : super(CartState(cart: [], quantity: 1, counter: 0, totalPrice: 200000));

  void saveData(List<ProductModel> products, int index) {
    dbHelper
        .insert(
      Cart(
        // id: index,
        productId: index.toString(),
        productName: products[index].model.toString(),
        initialPrice: products[index].price,
        productPrice: products[index].discount ?? 0,
        quantity: 1,
        image: products[index].image,
      ),
    )
        .then((value) {
      addCounter();
      log('Product Added to fav');
    }).onError((error, stackTrace) {
      log(error.toString());
    });
  }

  void getData() async {
    final cart = await dbHelper.getCartList();
    emit(state.copyWith(cart: cart));
  }

  void _setPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_items', state.counter);
    prefs.setInt('item_quantity', state.quantity);
    prefs.setDouble('total_price', state.totalPrice);
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

//increment
  void addQuantity(int id) {
    final index = state.cart.indexWhere((element) => element.id == id);
    final newCart = List.of(state.cart);
    newCart[index].quantity = (newCart[index].quantity! + 1);
    emit(state.copyWith(cart: newCart));
    _setPrefsItems();
  }

//decrement
  void deleteQuantity(int id) {
    final index = state.cart.indexWhere((element) => element.id == id);
    final newCart = List.of(state.cart);
    final currentQuantity = newCart[index].quantity;
    if (currentQuantity > 1) {
      newCart[index].quantity = currentQuantity - 1;
      emit(state.copyWith(cart: newCart));
    }
    _setPrefsItems();
  }

  void removeItem(int id) {
    final newCart = List.of(state.cart);
    newCart.removeWhere((element) => element.id == id);
    emit(state.copyWith(cart: newCart));
    _setPrefsItems();
    log("element Deleted from cart with id ${id.toString()}");
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
