import 'dart:typed_data';

import 'package:mobile_app/dashboard/modules/products/model/Product_model.dart';

abstract class ParentRepo {
// insert Model function for the MobilePhones Table model
  Future<void> insert({
    required String brand,
    required String model,
    required int storageCapacity,
    required String color,
    required double price,
    required double screenSize,
    required int ramCapacity,
    required String processor,
    required String cameraResolution,
    required String os,
    required int year,
    String availabilityState = 'In Stock',
    bool favorite = false,
    bool cart = false,
    String description = '''Here you can find all the information you need ''',
    required Uint32List image,
    Uint64List? video,
    required int quantity,
    double? discount,
  });

  Future<List<ProductModel>> fetch();

  Future<void> delete({required int ID});
// Update Product quantity and availabilityState in MobilePhones Table
  Future<void> UpdateProductState({
    required int id,
    required String availabilityState,
    required int quantity,
  });

// Update record with specified ID and quantity BY calling updateProductState Method
  Future<void> UpdateQuantity({required int id, required int quantity});

  // Update record for specified ID adding the product to Cart Products
  Future<void> UpdateCart({
    required int id,
    required bool cart,
  });
  // Update record for specified ID adding the product to Favorite Products
  Future<void> UpdateFavorite({
    required int id,
    required bool favorite,
  });

  // Update Product price using discount in MobilePhones Table
  Future<void> UpdatePrice({
    required int id,
    required double price,
    required double discount,
  });
}
