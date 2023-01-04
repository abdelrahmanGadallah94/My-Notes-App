import 'package:flutter/material.dart';
import 'package:my_notes_app/views/settings/app_colors.dart';
import '../settings/app_strings.dart';

class CustomEditNotesAppBar extends StatelessWidget {
  final void Function()? onPressed;
  const CustomEditNotesAppBar(
      {
        this.onPressed,
        Key? key,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          AppStrings.editNotesAppBar,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.kBlackColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
             onPressed: onPressed,
              icon: const Icon(
                Icons.check,
                size: 30,
              )),
        ),
      ],
    );
  }
}
