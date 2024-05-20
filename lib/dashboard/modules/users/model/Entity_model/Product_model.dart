import 'package:mobile_app/dashboard/modules/users/model/repo/local_db_data.dart';

class ProductModel {
  int? id,
      storageCapacity,
      ramCapacity,
      year,
      quantity,
      favorite,
      cart,
      availabilityState,
      discount;
  late int price;

  String? brand, model, color, processor, cameraResolution, os, image;
  double? screenSize;

  ProductModel.fromjson(Map<String, dynamic> map) {
    id = map['id'];
    brand = map['brand'];
    model = map['model'];
    storageCapacity = map['storageCapacity'];
    color = map['color'];
    price = map['price'];
    screenSize = map['screenSize'];
    ramCapacity = map['ramCapacity'];
    processor = map['processor'];
    cameraResolution = map['cameraResolution'];
    os = map['os'];
    year = map['year'];
    image = map['image'];
    quantity = map['quantity'];
    discount = map['discount'];
    favorite = map['favorite'];
    cart = map['cart'];
    availabilityState = map['availabilityState'];
  }
}
