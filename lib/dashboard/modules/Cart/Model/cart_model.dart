class Cart {
  int? id;
  String productId;
  String productName;
  late int initialPrice;
  late int productPrice;
  int quantity;
  String? image;

  Cart({
    this.id,
    required this.productId,
    required this.productName,
    required this.initialPrice,
    required this.productPrice,
    required this.quantity,
    this.image,
  });

  factory Cart.fromMap(Map<String, dynamic> json) => Cart(
        id: json['id'] as int?,
        productId: json['productId'] as String,
        productName: json['productName'] as String,
        initialPrice: json['initialPrice'] as int,
        productPrice: json['productPrice'] as int,
        quantity: json['quantity'] as int,
        image: json['image'] != null
            ? json['image']
            : "assets/phone-image/samsungZfold.jpg",
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'productId': productId,
        'productName': productName,
        'initialPrice': initialPrice,
        'productPrice': productPrice,
        'quantity': quantity,
        'image': image,
      };
}
