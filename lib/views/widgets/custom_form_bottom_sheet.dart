import 'package:flutter/material.dart';

import '../settings/app_strings.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class CustomFormBottomSheet extends StatelessWidget {
  const CustomFormBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  const [
            CustomTextFormField(hintText: AppStrings.title,maxLines: 1,),
            SizedBox(height: 15,),
            CustomTextFormField(hintText: AppStrings.content,maxLines: 7,),
            SizedBox(height: 30,),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}