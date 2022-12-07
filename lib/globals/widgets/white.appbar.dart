import 'package:flutter/material.dart';
import 'package:oriontek_flutter/themes/colors.dart';
import 'package:oriontek_flutter/themes/fonts.dart';

class WhiteAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  List<Widget>? actions;

  WhiteAppBar({super.key, this.actions, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      leading: BackButton(color: AppColors.black),
      elevation: 0,
      title: Text(
        title ?? '',
        style: AppFonts.textBig2,
      ),
      titleSpacing: 0,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
