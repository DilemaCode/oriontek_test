import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oriontek_flutter/globals/widgets/confim.dimiss.dart';
import 'package:oriontek_flutter/modules/clients/controller/client.controller.dart';
import 'package:oriontek_flutter/modules/clients/data/models/client.model.dart';
import 'package:oriontek_flutter/modules/clients/widgets/client.list.item.dart';
import 'package:oriontek_flutter/routes/app_routes.dart';
import 'package:oriontek_flutter/themes/colors.dart';
import 'package:oriontek_flutter/themes/fonts.dart';

class ClientsPage extends GetWidget<ClientsController> {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: AppColors.white,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: const EdgeInsetsDirectional.only(
                  start: 20,
                  bottom: 20,
                ),
                title: Text(
                  'Clients',
                  style: AppFonts.hugeText,
                ),
              ),
            ),
            //3
            if(controller.status==Status.loading)
            SliverToBoxAdapter(
              child: Container(
                height: 40,width: 40,
                alignment: Alignment.center,
                child: CircularProgressIndicator.adaptive(),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  ClientModel client = controller.clients[index];
                  return Dismissible(
                    confirmDismiss: (DismissDirection direction) async {
                      final result = await confirmDismiss(context: context);
                      if (result == true) {
                        controller.deleteClient(client);
                      }
                    },
                    background: Container(color: Colors.red),
                    key: Key('${client.clientId}'),
                    onDismissed: (direction) {
                      controller.clients.removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('${client.name} ha sido eliminado')));
                    },
                    child: ClientListItem(client: client),
                  );
                },
                childCount: controller.clients.length,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Get.toNamed(AppRoutes.AddClient);
            if (result == true) {
              controller.addClient();
            }
          },
          backgroundColor: AppColors.primary,
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
