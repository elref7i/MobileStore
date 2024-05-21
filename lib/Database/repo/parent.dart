import 'dart:typed_data';
import 'package:mobile_app/dashboard/modules/users/model/Entity_model/Product_model.dart';

abstract class ParentRepo {
// insert Model function for the MobilePhones Table model
  Future<void> insert({
    required String brand,
    required String model,
    required int storageCapacity,
    required String color,
    required int price,
    required int screenSize,
    required int ramCapacity,
    required String processor,
    required String cameraResolution,
    required String os,
    required int year,
    int availabilityState = 1,
    int favorite = 0,
    int cart = 0,
    String description = '''Here you can find all the information you need ''',
    required Uint8List image,
    Uint8List? video,
    required int quantity,
    int? discount,
  });

  Future<List<ProductModel>> fetch();

  Future<void> delete({required int ID});

  // Update Product quantity and availabilityState in MobilePhones Table
  Future<void> UpdateProductState({
    required int id,
    required int availabilityState,
    required int quantity,
  });

// Update record with specified ID and quantity BY calling updateProductState Method
  Future<void> UpdateQuantity({required int id, required int quantity});

  // Update record for specified ID adding the product to Cart Products
  Future<void> UpdateCart(
    int id,
    int cart,
  );
  // Update record for specified ID adding the product to Favorite Products
  Future<void> UpdateFavorite(
    int id,
    int favorite,
  );

  // Update Product price using discount in MobilePhones Table
  Future<void> UpdatePrice({
    required int id,
    required int price,
    required int discount,
  });
}



  // void generateProductDescriptions();

/////****************************************** */
// void generateProductDescriptions() async {
//   // Fetch product information from the database
//   List<ProductModel> products = await DatabaseRepo.instance.fetch();

//   // Generate description for each product
//   for (ProductModel product in products) {
//     String description = ProductDescriptionGenerator.generateDescription(product);
//     print(description);
//   }
// }


// it's class example TO DO:
// import 'package:mobile_app/dashboard/modules/users/model/Product_model.dart';

// class ProductDescriptionGenerator {
//   // Generate description for each product
//   static String generateDescription(ProductModel product) {
//     // Construct the description using the product information
//     String description = 'Brand: ${product.brand}\n';
//     description += 'Model: ${product.model}\n';
//     description += 'Storage Capacity: ${product.storageCapacity}\n';
//     description += 'Color: ${product.color}\n';
//     description += 'Price: \$${product.price}\n';
//     description += 'Screen Size: ${product.screenSize}\n';
//     description += 'RAM Capacity: ${product.ramCapacity}\n';
//     description += 'Processor: ${product.processor}\n';
//     description += 'Camera Resolution: ${product.cameraResolution}\n';
//     description += 'OS: ${product.os}\n';
//     description += 'Year: ${product.year}\n';
//     description += 'Availability: ${product.availabilityState}\n';
//     description += 'Quantity: ${product.quantity}\n';
//     description += 'Description: ${product.description}\n';

//     return description;
//   }
// }