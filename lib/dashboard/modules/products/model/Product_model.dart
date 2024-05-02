import 'package:mobile_app/dashboard/modules/products/view/components/Product_widget.dart';

class ProductModel {
  String? id;
  String? name;
  String? address;

  ProductModel({this.id, this.address, this.name});

  ProductModel.fromJson(Map map) {
    id = map['ID'].toString();
    address = map['address'];
    name = map['name'];
  }
}
