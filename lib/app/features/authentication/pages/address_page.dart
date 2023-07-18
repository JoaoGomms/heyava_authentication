import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:heyava_authentication/app/features/authentication/controllers/address_controller.dart';
import 'package:heyava_authentication/app/features/authentication/models/address_model.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/new_address_dialog.dart';

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context, builder: (context) => NewAddressDialog());
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Observer(
          builder: (context) {
            return ListView.builder(
                shrinkWrap: false,
                itemCount: controller.addressList.length,
                itemBuilder: (context, index) {
                  return Observer(builder: (context) {
                    AddressModel item = controller.addressList[index];
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _addressData(context, item),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => NewAddressDialog(
                                        address: item,
                                      ));
                            },
                            icon: const Icon(Icons.more_vert_outlined),
                          ),
                        ],
                      ),
                    );
                  });
                });
          },
        ),
      ),
    );
  }
}

_addressData(BuildContext context, AddressModel item) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.street,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text(
            item.neighbourhood,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Text(
          '${item.local} - ${item.state}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        if (item.complement.isNotEmpty)
          Text(
            item.complement,
            style: Theme.of(context).textTheme.bodySmall,
          ),
      ],
    );
