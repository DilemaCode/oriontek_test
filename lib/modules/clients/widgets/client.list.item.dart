import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oriontek_flutter/modules/clients/data/models/client.model.dart';
import 'package:oriontek_flutter/routes/app_routes.dart';
import 'package:oriontek_flutter/themes/colors.dart';
import 'package:oriontek_flutter/themes/fonts.dart';

class ClientListItem extends StatelessWidget {
  ClientModel client;
  ClientListItem({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed(AppRoutes.ClientDetail, arguments: client),
      minVerticalPadding: 20,
      leading: Hero(
        tag: '${client.clientId}',
        child:  CircleAvatar(
          backgroundColor: AppColors.primary,
          child: Icon(Icons.person, color: AppColors.white,),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            client.name ?? '',
            style: AppFonts.textBig2,
          ),
          Text(
            client.description ?? '',
            style: AppFonts.normalText,
          ),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
