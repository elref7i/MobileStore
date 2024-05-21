class Item {
  final String name;
  final int price;
  final String image;

  Item({required this.name, required this.price, required this.image});

  Map toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
    };
  }
}
