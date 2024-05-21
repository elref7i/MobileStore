class ProductModel {
  late int id;
  int? storageCapacity,
      ramCapacity,
      year,
      quantity,
      favorite,
      cart,
      discount,
      availabilityState;
  late int price;

  String? brand, model, color, processor, cameraResolution, os;
  late String image;
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
    image = map['image'] ?? "assets/phone-image/samsungZfold.jpg";
    quantity = map['quantity'];
    discount = map['discount'];
    favorite = map['favorite'];
    cart = map['cart'];
    availabilityState = map['availabilityState'];
  }
}
