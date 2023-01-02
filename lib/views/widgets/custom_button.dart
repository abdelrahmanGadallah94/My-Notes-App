import 'package:flutter/cupertino.dart';

import '../settings/app_colors.dart';
import '../settings/app_strings.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          color: AppColors.kCustomCardColor,
          borderRadius: BorderRadius.circular(15)
      ),
      child:  const Text(
        AppStrings.addNotes,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}