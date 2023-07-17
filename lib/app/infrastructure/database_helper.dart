import 'package:heyava_authentication/app/features/authentication/models/address_model.dart';
import 'package:heyava_authentication/app/features/authentication/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  final String dbName = 'local.db';
  final int databaseVersion = 1;

  final String userTableName = 'user';
  final String columnUserId = 'id';
  final String columnName = 'name';
  final String columnEmail = 'email';
  final String columnPassword = 'password';
  final String foreignKeyAddressId = 'addressId';

  final String addressTableName = 'address';
  final String columnAddressId = 'id';
  final String columnCep = 'cep';
  final String columnStreet = 'street';
  final String columnComplement = 'complement';
  final String columnNeighbourhood = 'neighbourhood';
  final String columnLocal = 'local';
  final String columnState = 'state';

  Future<Database> initDatabase() async {
    var databasePath = await getDatabasesPath();
    var path = '$databasePath$dbName';

    var db =
        await openDatabase(path, version: databaseVersion, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $addressTableName ("
        " $foreignKeyAddressId TEXT, "
        " $columnCep TEXT, "
        " $columnStreet TEXT, "
        " $columnComplement TEXT, "
        " $columnNeighbourhood TEXT, "
        " $columnLocal TEXT, "
        " $columnState TEXT,"
        " $columnAddressId TEXT,"
        " PRIMARY KEY ($columnAddressId)"
        ")");

    await db.execute("CREATE TABLE $userTableName ("
        " $columnUserId TEXT, "
        " $columnName TEXT, "
        " $columnEmail TEXT,"
        " $columnPassword TEXT, "
        " $foreignKeyAddressId TEXT, "
        " PRIMARY KEY ($columnUserId)"
        " FOREIGN KEY ($foreignKeyAddressId) REFERENCES $addressTableName ($foreignKeyAddressId)"
        ")");
  }

  Future<int> saveUser(UserModel user) async {
    var dbClient = await db;
    var result = await dbClient.insert(userTableName, user.toMap());
    return result;
  }

  Future<UserModel?> getUserById(String userId) async {
    var dbClient = await db;
    var result = await dbClient
        .rawQuery("SELECT * FROM $userTableName WHERE $columnUserId = $userId");

    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first);
    }

    return null;
  }

  Future<UserModel?> getUserLogin(String userEmail, String userPassword) async {
    var dbClient = await db;
    var result = await dbClient.query(
      userTableName,
      columns: [
        columnUserId,
        columnName,
        columnEmail,
        columnPassword,
        foreignKeyAddressId
      ],
      where: '$columnEmail = ? AND $columnPassword = ?',
      whereArgs: [userEmail, userPassword],
    );

    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first);
    }

    return null;
  }

  Future<int> updateUser(UserModel user) async {
    var dbClient = await db;
    var result = await dbClient.update(userTableName, user.toMap());
    return result;
  }

  Future<int> deleteUser(String userId) async {
    var dbClient = await db;
    var result = await dbClient
        .delete(userTableName, where: '$columnUserId = ?', whereArgs: [userId]);
    return result;
  }

  Future<int> saveAddress(AddressModel address) async {
    var dbClient = await db;
    var result = await dbClient.insert(addressTableName, address.toMap());
    return result;
  }

  Future<AddressModel?> getAddressById(String addressId) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM $addressTableName WHERE $columnAddressId = $addressId");

    if (result.isNotEmpty) {
      return AddressModel.fromMap(result.first);
    }

    return null;
  }

  Future<List<AddressModel>> getAddressList(num userAddressId) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM $addressTableName WHERE $foreignKeyAddressId = $userAddressId");

    List<AddressModel> addressList = [];

    if (result.isNotEmpty) {
      for (var address in result) {
        addressList.add(AddressModel.fromMap(address));
      }
    }

    return addressList;
  }

  Future<int> updateAddress(AddressModel address) async {
    var dbClient = await db;
    var result = await dbClient.update(addressTableName, address.toMap(),
        where: '$columnAddressId = ? ', whereArgs: [address.id]);
    return result;
  }

  Future<int> deleteAddress(num addressId) async {
    var dbClient = await db;
    var result = await dbClient.delete(addressTableName,
        where: '$columnAddressId = ?', whereArgs: [addressId]);
    return result;
  }
}
