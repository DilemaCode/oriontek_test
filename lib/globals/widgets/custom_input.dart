import 'package:flutter/material.dart';
import 'package:oriontek_flutter/themes/colors.dart';
import 'package:oriontek_flutter/themes/fonts.dart';

class CustomInput extends StatelessWidget {
  String placeholder;
  TextEditingController? controller;
  CustomInput({super.key, required this.placeholder, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        label: Text(placeholder),
        labelStyle: AppFonts.normalText.copyWith(color: AppColors.textGrey),
        floatingLabelStyle:
            AppFonts.normalText.copyWith(color: AppColors.primary),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.textGrey)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.textGrey)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary)),
      ),
    );
  }
}
