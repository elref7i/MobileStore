import 'dart:typed_data';
import 'dart:developer';
import 'package:mobile_app/dashboard/modules/users/model/repo/parent.dart';
import 'package:mobile_app/dashboard/modules/users/model/Entity_model/Product_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo extends ParentRepo {
  DatabaseRepo._init();
  static DatabaseRepo? _singletoneObject;
  // take object from DB Class
  static late Database database;

  static Future<DatabaseRepo> get instance async {
    if (_singletoneObject == null) {
      await _initDatabase();
      _singletoneObject = DatabaseRepo._init();
    }
    return _singletoneObject!;
  }

  // Create Database
  static Future<void> _initDatabase() async {
    // Get the path of the database file
    final String databasePath = await getDatabasesPath();
    // add files to the database
    final String path = databasePath + "/Store.db";

    database = await openDatabase(
      path,
      version: 88,
      onCreate: _createTables,
    );
  }

  static Future<void> _createTables(Database db, _) async {
    await db.execute("""
    CREATE TABLE MobilePhones (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Brand VARCHAR(50) NOT NULL,
    Model VARCHAR(100) NOT NULL,
    StorageCapacity INTEGER NOT NULL,
    Color VARCHAR(50) ,
    Price INTEGER(10, 2) NOT NULL,
    Screen_size INTEGER(4, 2),
    RamCapacity INTEGER,
    Processor VARCHAR(100) NOT NULL DEFAULT '64MP',
    CameraResolution VARCHAR(50),
    OS VARCHAR(50) NOT NULL,
    Year INTEGER,
    AvailabilityState INTEGER DEFAULT 1,
    Favorite INTEGER DEFAULT 0,
    Cart INTEGER DEFAULT 0,
    Description TEXT,
    Image BLOB NOT NULL,
    Video BLOB,
    Quantity INTEGER,
    Discount INTEGER(10, 2) DEFAULT 0.0
  );
    """);
  }

  // insert Product to MobilePhones Table
  @override
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
  }) async {
    await database.insert(
      'MobilePhones',
      {
        'Brand': brand,
        'Model': model,
        'StorageCapacity': storageCapacity,
        'Color': color,
        'Price': price,
        'Screen_size': screenSize,
        'RamCapacity': ramCapacity,
        'Processor': processor,
        'CameraResolution': cameraResolution,
        'OS': os,
        'Year': year,
        'AvailabilityState': availabilityState,
        'Favorite': favorite,
        'Cart': cart,
        'Description': description,
        'Image': image,
        'Video': video,
        'Quantity': quantity,
        'Discount': discount,
      },
    );
    log("insert in product_cubit file done");
  }

  // fetch Product from MobilePhones Table
  @override
  Future<List<ProductModel>> fetch() async {
    log((await database.getVersion()).toString() + ' fetched product');
    return (await database.query('MobilePhones'))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<List<ProductModel>> fetchFavoriteProducts() async {
    return (await database
            .query('MobilePhones', where: 'Favorite=?', whereArgs: [1]))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<List<ProductModel>> fetchCartProducts() async {
    return (await database
            .query('MobilePhones', where: 'Cart=?', whereArgs: [1]))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  @override
  Future<void> delete({required Comparable<num> ID}) async {
    await database.delete('MobilePhones', where: 'ID=?', whereArgs: [ID]);
  }

  @override
  Future<void> UpdateProductState({
    required int id,
    required int availabilityState,
    required int quantity,
  }) async {
    await database.update(
      'MobilePhones',
      {
        'AvailabilityState': availabilityState,
        'Quantity': quantity,
      },
      where: 'Id = ?',
      whereArgs: [id],
    );
  }

// Update record with specified ID and quantity BY calling updateProductState Method
  @override
  Future<void> UpdateQuantity({required int id, required int quantity}) async {
    await DatabaseRepo.instance.then((DB) {
      DB.UpdateProductState(
        id: id,
        availabilityState: quantity > 0 ? 1 : 0,
        quantity: quantity,
      );
    });
  }

  // Update record by specified ID => adding the product to Cart Products
  @override
  Future<void> UpdateCart(
    int id,
    int cart,
  ) async {
    await database.update(
      'MobilePhones',
      {
        'Cart': cart,
      },
      where: 'Id = ?',
      whereArgs: [id],
    );
  }

  // Update record by specified ID => adding the product to Favorite Products
  @override
  Future<void> UpdateFavorite(
    int id,
    int favorite,
  ) async {
    await database.update(
      'MobilePhones',
      {
        'Favorite': favorite,
      },
      where: 'Id = ?',
      whereArgs: [id],
    );
  }

  // ==========Update Product price by discount in MobilePhones Table ========
  @override
  Future<void> UpdatePrice({
    required int id,
    required int price,
    required int discount,
  }) async {
    // ID exists ???
    List<Map<String, dynamic>> products = await database.query(
      'MobilePhones',
      where: 'Id = ?',
      whereArgs: [id],
    );

    //  product exists====> update with discount
    if (products.isNotEmpty) {
      // Calculate the new price after applying the discount
      int newPrice = (price * (1 - (discount / 100))) as int;

      // Update the product's price in the database
      await database.update(
        'MobilePhones',
        {
          'Price': newPrice,
        },
        where: 'Id = ?',
        whereArgs: [id],
      );
    } else {
      // not exist !!! ===> notify User
      print('Product with ID $id does not exist.');
      //============>>notify for developer
      log("Product with ID $id is not Found");
    }
  }
}
