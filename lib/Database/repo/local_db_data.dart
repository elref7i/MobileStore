import 'package:mobile_app/dashboard/modules/users/model/Entity_model/Product_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo {
  Database? database;
  DatabaseRepo? instance;
  Future<Database> initDB() async {
    try {
      String path = (await getDatabasesPath()) + "/products.db";
      database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          return db.execute('''CREATE TABLE products(
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              brand TEXT,
              model TEXT, 
              storageCapacity INTEGER, 
              color TEXT, 
              price INTEGER, 
              screenSize REAL, 
              ramCapacity INTEGER, 
              processor TEXT, 
              cameraResolution TEXT, 
              os TEXT, 
              year INTEGER, 
              image TEXT, 
              quantity INTEGER, 
              favorite INTEGER, 
              cart INTEGER, 
              availabilityState INTEGER,
              discount INTEGER
            )''');
        },
      );
      return database!;
    } catch (e) {
      print('Error initializing database: $e');
      throw e;
    }
  }

  Future<List<ProductModel>> fetchProducts() async {
    if (database == null) {
      await initDB();
    }
    List<Map<String, dynamic>> maps = await database!.query('products');
    return maps.map((e) => ProductModel.fromjson(e)).toList();
  }

  Future<List<ProductModel>> fetchFavorites() async {
    if (database == null) {
      await initDB();
    }
    List<Map<String, dynamic>> maps = await database!
        .query('products', where: 'favorite = ?', whereArgs: [1]);
    return maps.map((e) => ProductModel.fromjson(e)).toList();
  }

  Future<List<ProductModel>> fetchCart() async {
    if (database == null) {
      await initDB();
    }
    List<Map<String, dynamic>> maps =
        await database!.query('products', where: 'cart = ?', whereArgs: [1]);
    return maps.map((e) => ProductModel.fromjson(e)).toList();
  }

  Future<void> insertProduct({
    int? storageCapacity,
    int? price,
    int? ramCapacity,
    int? year,
    int? quantity,
    int? availabilityState,
    String? brand,
    String? model,
    String? color,
    String? processor,
    String? cameraResolution,
    String? os,
    String? image,
    double? screenSize,
    int? discount,
  }) async {
    if (database == null) {
      await initDB();
    }
    await database!.insert('products', {
      "storageCapacity": storageCapacity,
      "price": price,
      "ramCapacity": ramCapacity,
      "year": year,
      "quantity": quantity,
      "favorite": 0,
      "cart": 0,
      "availabilityState": availabilityState,
      "brand": brand,
      "model": model,
      "color": color,
      "processor": processor,
      "cameraResolution": cameraResolution,
      "os": os,
      "image": image,
      "screenSize": screenSize,
      "discount": discount,
    });
  }

  Future<void> updateCart(int id, int value) async {
    if (database == null) {
      await initDB();
    }
    await database!
        .update('products', {'cart': value}, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFavorite(int id, int value) async {
    if (database == null) {
      await initDB();
    }
    await database!.update('products', {'favorite': value},
        where: 'id = ?', whereArgs: [id]);
  }
}
