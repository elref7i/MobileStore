import 'dart:developer';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_app/dashboard/modules/users/controller/Mobile_state.dart';
import 'package:mobile_app/dashboard/modules/users/model/Entity_model/Product_model.dart';
import 'package:mobile_app/Database/repo/local_db_data.dart';
import 'package:sqflite/sqlite_api.dart';

class ProductCubit extends Cubit<ProductState> {
  static final ProductCubit instance = ProductCubit._internal();
  ProductCubit._internal() : super(ProductStateLoading()) {
    init();
  }

  factory ProductCubit() {
    return instance;
  }

  final DatabaseRepo dbRepo = DatabaseRepo();

  List<ProductModel> products = [];
  String imagePath = 'assets/phone-image/iphone14.jpg';
  Future<void> init() async {
    emit(ProductStateLoading());
    await dbRepo.initDB();
    await dbRepo.insertProduct(
      storageCapacity: 64,
      price: 22000,
      ramCapacity: 6,
      year: 2024,
      quantity: 1,
      availabilityState: 1,
      brand: 'Samsung',
      model: 'Galaxy S23',
      color: 'Black',
      processor: 'processor',
      cameraResolution: 'cameraResolution',
      os: 'os',
      image: imagePath,
      screenSize: 6.0,
      discount: 0,
    );
    products = await dbRepo.fetchProducts();

    if (products.isEmpty) {
      emit(ProductStateEmpty());
    } else {
      emit(ProductStateLoaded());
    }
  }

  Future<void> addToCart(int id, int state) async {
    await dbRepo.updateCart(id, state);
    products = await dbRepo.fetchProducts();
    emit(ProductStateLoaded());
  }

  Future<void> addToFavourite(int id, int state) async {
    await dbRepo.updateFavorite(id, state);
    products = await dbRepo.fetchProducts();
    emit(ProductStateLoaded());
  }

  Future<void> addItemToFavorite(int value, int id) async {
    await dbRepo.updateFavorite(id, value);
    products = await dbRepo.fetchProducts();
    emit(ProductStateLoaded());
  }
}
