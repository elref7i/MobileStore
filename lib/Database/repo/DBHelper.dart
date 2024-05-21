import 'dart:developer';
import 'package:mobile_app/dashboard/modules/Cart/Model/cart_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  Future<Database?> get instance async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    String directory = await getDatabasesPath();
    String path = directory + '/cart.db';
    var db = await openDatabase(path, version: 7, onCreate: _onCreate);
    return db;
  }

  // Creating database table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE cart(
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      productId VARCHAR, 
      productName TEXT,
      initialPrice INTEGER,
      productPrice INTEGER,
      quantity INTEGER, 
      image BLOB)''');
    log("created cart");
  }

  // Inserting data into the table
  Future<Cart> insert(Cart cart) async {
    try {
      var dbClient = await instance;
      if (dbClient != null) {
        cart.id = await dbClient.insert('cart', cart.toMap());
        log('Cart inserted with id: ${cart.id}');
      } else {
        log('Database client is null, insert operation failed.');
      }
    } catch (e) {
      log('Error inserting cart: $e');
    }
    return cart;
  }

  // Getting all the items in the list from the database
  Future<List<Cart>> getCartList() async {
    try {
      var dbClient = await instance;
      if (dbClient == null) return [];
      final List<Map<String, Object?>> queryResult =
          await dbClient.query('cart');
      return queryResult.map((result) => Cart.fromMap(result)).toList();
    } catch (e) {
      log('Error getting cart list: $e');
      return [];
    }
  }

  // Updating quantity of a cart item
  Future<int> updateQuantity(Cart cart) async {
    try {
      var dbClient = await instance;
      if (dbClient != null) {
        return await dbClient.update('cart', cart.toMap(),
            where: "productId = ?", whereArgs: [cart.productId]);
      } else {
        log('Database client is null, update operation failed.');
        return 0;
      }
    } catch (e) {
      log('Error updating cart quantity: $e');
      return 0;
    }
  }

  // Deleting an item from the cart screen
  Future<int> deleteCartItem(int id) async {
    try {
      var dbClient = await instance;
      if (dbClient != null) {
        return await dbClient.delete('cart', where: 'id = ?', whereArgs: [id]);
      } else {
        log('Database client is null, delete operation failed.');
        return 0;
      }
    } catch (e) {
      log('Error deleting cart item: $e');
      return 0;
    }
  }
}
