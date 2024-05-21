// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/widgets.dart';
// import 'package:mobile_app/Database/repo/local_db_data.dart';
// import 'package:mobile_app/Database/repo/parent.dart';

// import 'package:mobile_app/dashboard/modules/users/model/Entity_model/Product_model.dart';
// import 'package:sqflite/sqlite_api.dart';

// class FirebaseRepo extends ParentRepo {
//   static late Database _database;
//   FirebaseRepo._init();
//   static FirebaseRepo instance = FirebaseRepo._init();
//   @override
//   Future<List<ProductModel>> fetch() async {
//     return await FirebaseFirestore.instance
//         .collection("products")
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       return querySnapshot.docs.map((e) {
//         final Map data = e.data() as Map;
//         Map m = {
//           "brand": e["brand"],
//           "price": e["price"],
//           "id": e.reference.id,
//           "discount": e["discount"],
//           "os": e["os"],
//           "processor": e["processor"],
//           "ramCapacity": e["ramCapacity"],
//           "model": e["model"],
//           "year": e["year"],
//         };
//         return ProductModel.fromJson(m);
//       }).toList();
//     });
//   }

//   /////////////////++++++++++++++++++++++++++++++++
//   static Future addProductToCart({
//     required BuildContext context,
//     required ProductModel productModel,
//   }) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('Cart')
//           .doc(auth.currentUser!.phoneNumber)
//           .collection('myCart')
//           .where('productID', isEqualTo: productModel.id)
//           .get()
//           .then((value) async {
//         if (value.size < 1) {
//           await FirebaseFirestore.instance
//               .collection('Cart')
//               .doc(auth.currentUser!.phoneNumber)
//               .collection('myCart')
//               .doc(productModel.id)
//               .set(productModel.toMap())
//               .whenComplete(() {
//             log('Data Added');
//           });
//         }
//       });
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// ////////////////////////////////////////////////////////////////

//   @override
//   Future<void> delete({required int ID}) async {
//     CollectionReference products =
//         FirebaseFirestore.instance.collection("products");
//     await products.doc(ID.toString()).delete();
//   }

//   ///NEED to delete OR Explain OR take a Look Ya HANEEN 🤔😏
//   @override
//   Future<void> update({required int ID}) async {
//     CollectionReference products =
//         FirebaseFirestore.instance.collection("products");
//     await products
//         .doc(ID.toString())
//         .update({"price": " "})
//         .then((value) => print("Price Updated"))
//         .catchError((error) => print("Faild"));
//   }

//   @override
//   Future<void> insert({
//     required String brand,
//     required String model,
//     required int storageCapacity,
//     required String color,
//     required int price,
//     required int screenSize,
//     required int ramCapacity,
//     required String processor,
//     required String cameraResolution,
//     required String os,
//     required int year,
//     int availabilityState = 1,
//     int favorite = 0,
//     int cart = 0,
//     String description = '''Here you can find all the information you need ''',
//     required String image,
//     String? video,
//     required int quantity,
//     int? discount,
//   }) async {
//     CollectionReference products =
//         FirebaseFirestore.instance.collection("products");
//     await products
//         .add({
//           "brand": brand,
//           "Price": price,
//           "color": color,
//           "os": os,
//           "cameraResolution": cameraResolution,
//           "discount": discount,
//           "quantity": quantity,
//           "year": year,
//           "screenSize": screenSize,
//           "model": model,
//           "ramCapacity": ramCapacity,
//         })
//         .then((value) => print("Product Added"))
//         .catchError((error) => print("Failed"));
//   }

//   @override
//   Future<void> UpdateProductState({
//     required int id,
//     required int availabilityState,
//     required int quantity,
//   }) async {
//     await _database.update(
//       'MobilePhones',
//       {
//         'AvailabilityState': availabilityState,
//         'Quantity': quantity,
//       },
//       where: 'Id = ?',
//       whereArgs: [id],
//     );
//   }

//   // Update record with specified ID and quantity
//   @override
//   Future<void> UpdateQuantity({required int id, required int quantity}) async {
//     await DatabaseRepo.instance.then((DB) {
//       DB.UpdateProductState(
//         id: id,
//         availabilityState: quantity > 0 ? 1 : 0,
//         quantity: quantity,
//       );
//     });
//   }

//   // Update record by specified ID for Cart Products
//   @override
//   Future<void> UpdateCart(
//     int? id,
//     int? cart,
//   ) async {
//     await _database.update(
//       'MobilePhones',
//       {
//         'Cart': cart,
//       },
//       where: 'Id = ?',
//       whereArgs: [id],
//     );
//   }

//   // Update record by specified ID for Favorite Products
//   @override
//   Future<void> UpdateFavorite(
//     int? id,
//     int? favorite,
//   ) async {
//     await _database.update(
//       'MobilePhones',
//       {
//         'Favorite': favorite,
//       },
//       where: 'Id = ?',
//       whereArgs: [id],
//     );
//   }

//   // Update Product price with discount in MobilePhones Table
//   @override
//   Future<void> UpdatePrice({
//     required int id,
//     required int price,
//     required int discount,
//   }) async {
//     // Check if the product with the specified ID exists
//     List<Map<String, dynamic>> products = await _database.query(
//       'MobilePhones',
//       where: 'Id = ?',
//       whereArgs: [id],
//     );

//     // If the product exists, update its price with the discount
//     if (products.isNotEmpty) {
//       // Calculate the new price after applying the discount
//       double newPrice = price * (1 - (discount / 100));

//       // Update the product's price in the database
//       await _database.update(
//         'MobilePhones',
//         {
//           'Price': newPrice,
//         },
//         where: 'Id = ?',
//         whereArgs: [id],
//       );
//     } else {
//       // If the product does not exist, you can handle this case as needed
//       print('Product with ID $id does not exist.');
//       log("Product with ID $id is not Found");
//     }
//   }
// }
