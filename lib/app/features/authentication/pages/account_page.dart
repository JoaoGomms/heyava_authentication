import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:heyava_authentication/app/infrastructure/session_controller.dart';

import '../models/user_model.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  SessionController sessionController = GetIt.I.get<SessionController>();

  @override
  Widget build(BuildContext context) {
    UserModel user = sessionController.user!;

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/address');
            },
            icon: const Icon(Icons.map))
      ]),
      body: SafeArea(
        child: Column(
          children: [
            Text(user.email),
            Text(user.name),
            Text(user.id.toString()),
            ElevatedButton(
              onPressed: () {
                sessionController.logout();
                Navigator.of(context).pushReplacementNamed('/authentication');
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
