import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:heyava_authentication/app/app_widget.dart';
import 'package:heyava_authentication/app/infrastructure/database_helper.dart';
import 'package:heyava_authentication/app/infrastructure/register_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await registerDatabase();
  registerControllers();
  registerClients();

  DatabaseHelper dbHelper = GetIt.I.get<DatabaseHelper>();
  await dbHelper.initDatabase();

  runApp(const AppWidget());
}
