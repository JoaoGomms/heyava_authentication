import 'package:flutter_test/flutter_test.dart';
import 'package:heyava_authentication/app/infrastructure/database_helper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sqflite/sqflite.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class MockSqfLite extends Mock implements Sqflite {}

void main() {
  DatabaseHelper databaseHelper = DatabaseHelper();
  final MockSqfLite mockSqfLite = MockSqfLite();

  setUp(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });
  test('Create Database File', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    const String path = '../../../database';
    when(() async => mockSqfLite.getDatabasesPath())
        .thenAnswer((_) async => path);

    final mockDatabase = openDatabase(path);

    when(() async => await openDatabase(any()))
        .thenAnswer((_) async => mockDatabase);
    final db = await databaseHelper.initDatabase();

    expect(db, isNotNull);
  });
}
