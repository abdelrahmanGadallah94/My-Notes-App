import 'package:flutter/material.dart';

import '../settings/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.maxLines
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      cursorColor: AppColors.kCustomCardColor,
      cursorHeight: 30,
      cursorWidth: 2,
      decoration:  InputDecoration(
        hintText: hintText,
          enabledBorder:  OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.kWhiteColor),
            borderRadius: BorderRadius.circular(20),

          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.kWhiteColor),
            borderRadius: BorderRadius.circular(20),
          )
      ),
    );
  }
}