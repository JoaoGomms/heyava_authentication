import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:heyava_authentication/app/features/authentication/controllers/change_password_controller.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/change_password_dialog.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/toast/alert_toast.dart';
import 'package:heyava_authentication/app/infrastructure/session_controller.dart';
import '../models/user_model.dart';
import 'components/toast/error_toast.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  SessionController sessionController = GetIt.I.get<SessionController>();
  ChangePasswordController changePasswordController =
      GetIt.I.get<ChangePasswordController>();

  @override
  Widget build(BuildContext context) {
    UserModel user = sessionController.user!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.lightBlue[200]),
                    child: Center(
                      child: Text(
                        user.name.substring(0, 2).toUpperCase(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(user.email),
                ),
                Text('${user.name}#${user.id.toStringAsFixed(3).substring(2)}'),
              ],
            ),
            const SizedBox(
              height: 36,
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Endereços'),
              onTap: () {
                Navigator.of(context).pushNamed('/address');
              },
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            ),
            Observer(builder: (context) {
              if (changePasswordController.passwordWasChanged) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AlertToast(label: 'Sua senha foi alterada'),
                );
              }

              return Container();
            }),
            ListTile(
              leading: const Icon(Icons.password),
              title: const Text('Alterar Senha'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => ChangePasswordDialog(),
                );
              },
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app_rounded),
              title: const Text('Logout'),
              onTap: () {
                sessionController.logout();
                Navigator.of(context).pushReplacementNamed('/authentication');
              },
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
