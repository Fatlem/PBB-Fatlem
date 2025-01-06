import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'products.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE products ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'name TEXT NOT NULL, '
          'description TEXT, '
          'image_path TEXT, '
          'price REAL NOT NULL'
          ')',
        );

        await db.execute(
          'CREATE TABLE purchases ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'total REAL NOT NULL, '
          'created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP'
          ')',
        );

        await db.execute(
          'CREATE TABLE payments ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'name TEXT NOT NULL, '
          'total REAL NOT NULL, '
          'created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP'
          ')',
        );
      },
    );
  }

  Future<void> insertPayment(Map<String, dynamic> payment) async {
    try {
      final db = await database;
      await db.insert(
        'payments',
        payment,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('Error inserting payment: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    try {
      final db = await database;
      return await db.query('products');
    } catch (e) {
      print('Error getting products: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getPurchaseHistory() async {
    try {
      final db = await database;
      return await db.query('purchases');
    } catch (e) {
      print('Error getting purchase history: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getPayments() async {
    try {
      final db = await database;
      return await db.query('payments');
    } catch (e) {
      print('Error getting payments: $e');
      return [];
    }
  }
}
