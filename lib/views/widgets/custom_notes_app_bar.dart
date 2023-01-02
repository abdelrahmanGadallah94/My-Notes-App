import 'package:flutter/material.dart';

import '../settings/app_colors.dart';
import '../settings/app_strings.dart';

class CustomNotesAppBar extends StatelessWidget {
  const CustomNotesAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         const Text(
          AppStrings.notesAppBar,
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:  const BorderSide(
                    color: AppColors.kWhiteColor,
                  )),
              hintText: AppStrings.notesAppBarTextFieldHintText,
              hintStyle: const TextStyle(color: AppColors.kWhiteColor),
              suffixIcon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.search)),
            ),
          ),
        ),
      ],
    );
  }
}