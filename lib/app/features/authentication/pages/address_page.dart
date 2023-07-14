import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:heyava_authentication/app/features/authentication/controllers/address_controller.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  AddressController controller = GetIt.I.get<AddressController>();
  @override
  void initState() {
    super.initState();
    controller.fetchAddressList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(
              onChanged: (text) => controller.cepField.text = text,
            ),
            TextField(
              onChanged: (text) => controller.streetField.text = text,
            ),
            TextField(
              onChanged: (text) => controller.complementdField.text = text,
            ),
            TextField(
              onChanged: (text) => controller.neighbourhoodField.text = text,
            ),
            TextField(
              onChanged: (text) => controller.localField.text = text,
            ),
            TextField(
              onChanged: (text) => controller.stateField.text = text,
            ),
            ElevatedButton(
                onPressed: controller.saveAddress,
                child: const Text('Save Address')),
            SizedBox(
              height: 500,
              child: Observer(
                builder: (context) {
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: false,
                      itemCount: controller.addressList.length,
                      itemBuilder: (context, index) {
                        var item = controller.addressList[index];
                        return ListTile(
                          title: Text(
                              '${item.cep} e ${item.complement} e ${item.id}'),
                        );
                      });
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
