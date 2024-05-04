import 'dart:developer';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_app/dashboard/modules/users/model/Entity_model/Product_model.dart';
import 'package:mobile_app/dashboard/modules/users/model/repo/local_db_data.dart';
import 'package:sqflite/sqlite_api.dart';

part 'Product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  static ProductCubit instance = ProductCubit();

  ProductCubit() : super(ProductStateLoading()) {
    init();
  }
  List<ProductModel> products = [];

  Future<void> init() async {
    await (await DatabaseRepo.instance).insert(
        brand: 'Samsung_Galaxy',
        model: 'S 23',
        storageCapacity: 64,
        color: 'BLACK',
        price: 22000,
        screenSize: 6,
        ramCapacity: 6,
        processor: 'processor',
        cameraResolution: "cameraResolution",
        os: 'os',
        year: 2024,
        image: Uint8List(10),
        quantity: 1);
    emit(ProductStateLoading());
    products = await (await DatabaseRepo.instance).fetch();
    // MobilePhones = await (await FirebaseRepo.instance).fetch();
    if (products.isEmpty) {
      emit(ProductStateEmpty());
    } else {
      emit(ProductStateLoaded());
    }
  }

  void addToCart(int id, int state) async {
    log(id as String);
    // await DatabaseRepo.instance.UpdateCart(id,state);
    init();
    emit(ProductStateLoaded());
  }

  void addToFavourite(int id, bool state) async {
    log(id as String);
    // await DatabaseRepo.instance.UpdateFavorite(id,state);
    init();
    emit(ProductStateLoaded());
  }
}
