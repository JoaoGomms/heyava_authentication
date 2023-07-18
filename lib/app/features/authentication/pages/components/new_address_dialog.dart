import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:heyava_authentication/app/features/authentication/controllers/address_controller.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/button/app_elevated_button.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/text_field/app_text_field.dart';

import '../../models/address_model.dart';

class NewAddressDialog extends StatelessWidget {
  final AddressController controller = GetIt.I.get<AddressController>();

  final AddressModel? address;

  NewAddressDialog({Key? key, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (address != null) {
      controller.cepField.text = address!.cep;
      controller.streetField.text = address!.street;
      controller.complementField.text = address!.complement;
      controller.neighbourhoodField.text = address!.neighbourhood;
      controller.stateField.text = address!.state;
      controller.localField.text = address!.local;
    }

    return Observer(builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (controller.isLoadingAddressFromCep)
                  const LinearProgressIndicator(),
                AppTextField(
                  controller: controller.cepField,
                  label: 'CEP',
                  onChanged: (value) {
                    if (value!.length == 8) {
                      controller.cepReaction();
                    }
                  },
                ),
                AppTextField(
                    controller: controller.streetField,
                    label: 'Rua',
                    enabled: !controller.isLoadingAddressFromCep),
                AppTextField(
                    controller: controller.complementField,
                    label: 'Complemento',
                    enabled: !controller.isLoadingAddressFromCep),
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        child: AppTextField(
                            controller: controller.neighbourhoodField,
                            label: 'Bairro',
                            enabled: !controller.isLoadingAddressFromCep),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: AppTextField(
                            controller: controller.stateField,
                            label: 'Estado',
                            enabled: !controller.isLoadingAddressFromCep),
                      ),
                    ],
                  ),
                ),
                AppTextField(
                    controller: controller.localField,
                    label: 'Localidade',
                    enabled: !controller.isLoadingAddressFromCep),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: AppElevatedButton(
                          onPressed: () {
                            if (address != null) {
                              controller.updateAddress(address!.id);
                            } else {
                              controller.saveAddress();
                            }

                            Navigator.of(context).pop();
                          },
                          text: 'Save Address'),
                    ),
                    if (address != null) ...[
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 48,
                          padding: const EdgeInsets.only(left: 8.0),
                          child: IconButton(
                              onPressed: () {
                                controller.deleteAddress(address!.id);
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                                color: Colors.red,
                              )),
                        ),
                      )
                    ]
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
