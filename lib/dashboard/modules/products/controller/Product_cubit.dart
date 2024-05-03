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
  // DatabaseRepo repo = DatabaseRepo();
  List<ProductModel> products = [];

  Future<void> init() async {
    emit(ProductStateLoading());
    products = await (await DatabaseRepo.instance).fetch();

    // products =  await ( DatabaseRepo.instance).insert (
    //    brand: 'brand', model: 'model', storageCapacity: 64,
    //    color: 'color', price: 9000, screenSize: 6.7,
    //    ramCapacity: 6, processor: 'processor',
    //    cameraResolution: "cameraResolution", os: "os", year: 2024,
    //    image: Uint32List(10), quantity: 1);

    // MobilePhones = await (await FirebaseRepo.instance).fetch();
    if (products.isEmpty) {
      emit(ProductStateEmpty());
    } else {
      emit(ProductStateLoaded());
    }
  }

  void addToCart(int id, bool state) async {
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
