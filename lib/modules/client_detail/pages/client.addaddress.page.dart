import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oriontek_flutter/globals/widgets/custom_input.dart';
import 'package:oriontek_flutter/globals/widgets/white.appbar.dart';
import 'package:oriontek_flutter/modules/client_detail/controller/client.detail.controller.dart';

class ClientAddAddressPage extends GetWidget {
  const ClientAddAddressPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteAppBar(
        title: 'Agregar Descripción',
        actions: [
          TextButton(
              onPressed: () {
                Get.back(result: true);
              },
              child: const Text('Guardar'))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            CustomInput(
              placeholder: 'Descripción',
              controller: ClientDetailController.instance.inputAddressCon,
            ),
            SizedBox(height: 10),
            CustomInput(
              placeholder: 'Ciudad',
              controller: ClientDetailController.instance.inputCityCon,
            ),
            SizedBox(height: 10),
            CustomInput(
              placeholder: 'Pais',
              controller: ClientDetailController.instance.inputCountryCon,
            ),
            SizedBox(height: 10),
            CustomInput(
              placeholder: 'Codigo Postal',
              controller: ClientDetailController.instance.inputZipCodeCon,
            ),
          ],
        ),
      ),
    );
  }
}
