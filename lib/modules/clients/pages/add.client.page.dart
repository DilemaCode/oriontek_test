import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oriontek_flutter/globals/widgets/custom_input.dart';
import 'package:oriontek_flutter/globals/widgets/white.appbar.dart';
import 'package:oriontek_flutter/modules/clients/controller/client.controller.dart';

class AddClientPage extends GetWidget {
  const AddClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteAppBar(
        title: 'Nuevo cliente',
        actions: [
          TextButton(
            onPressed: () {
              Get.back(result: true);
            },
            child: const Text('Guardar'),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Column(
          children: [
            CustomInput(placeholder: 'Nombre', controller: ClientsController.instance.inputNameCon,),
            SizedBox(height: 10),
            CustomInput(placeholder: 'Descripción', controller: ClientsController.instance.inputDescriptionCon,),
          ],
        ),
      ),
    );
  }
}
