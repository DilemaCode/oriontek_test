import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oriontek_flutter/globals/widgets/confim.dimiss.dart';
import 'package:oriontek_flutter/modules/client_detail/controller/client.detail.controller.dart';
import 'package:oriontek_flutter/modules/client_detail/data/models/client.detail.model.dart';
import 'package:oriontek_flutter/routes/app_routes.dart';
import 'package:oriontek_flutter/themes/colors.dart';
import 'package:oriontek_flutter/themes/fonts.dart';

class ClientDetailPage extends GetWidget<ClientDetailController> {
  const ClientDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: BackButton(color: AppColors.black),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () async {
                final result = await Get.toNamed(AppRoutes.ClientAddAddress);
                if (result == true) {
                  controller.addAddress();
                }
              },
              icon: Icon(Icons.add),
              color: AppColors.black,
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(120.0), // here the desired height
            child: Column(
              children: [
                Hero(
                  tag: 'Client_${controller.client.value.clientId}',
                  child: CircleAvatar(
                    minRadius: 20,
                    maxRadius: 35,
                    backgroundColor: AppColors.primary,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  controller.client.value.name ?? '',
                  style: AppFonts.textBig2,
                ),
                Text(
                  controller.client.value.description ?? '',
                  style: AppFonts.normalText,
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        body:
          controller.addresses.isEmpty?
          Center(
            child: Text('Este cliente no tiene direcciones, agregue una'),
          )
          :
         ListView.builder(
            itemCount: controller.addresses.length,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            itemBuilder: (_, i) {
              ClientAddressModel address = controller.addresses[i];
              return Card(
                child: Dismissible(
                  key: Key('$i'),
                  background: Container(color: Colors.red),
                  confirmDismiss: (DismissDirection direction) async {
                    final result = await confirmDismiss(context: context);
                    if (result == true) {
                      controller.deleteAddress(address);
                    }
                  },
                  onDismissed: (direction) {
                    controller.addresses.removeAt(i);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Dirección eliminada')));
                  },
                  child: ListTile(
                    minVerticalPadding: 10,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${address.address}',
                          style: AppFonts.textBig2,
                        ),
                        Text(
                          '${address.city}, ${address.country} ${address.zipCode}',
                          style: AppFonts.normalText,
                          textScaleFactor: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
        // floatingActionButton: ElevatedButton(
        //   onPressed: () {
        //     // Add your onPressed code here!
        //   },
        //   // backgroundColor: AppColors.primary,
        //   child: Icon(
        //     Icons.add,
        //     color: AppColors.white,
        //   ),
        // ),
      ),
    );
  }
}
