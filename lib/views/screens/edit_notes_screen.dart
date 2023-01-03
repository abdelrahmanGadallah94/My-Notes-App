import 'package:flutter/material.dart';
import 'package:my_notes_app/views/settings/app_strings.dart';

import '../widgets/custom_edit_notes_app_bar.dart';
import '../widgets/custom_text_form_field.dart';

class EditNotesScreen extends StatelessWidget {
  const EditNotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
        child: Column(
          children:  const [
            CustomEditNotesAppBar(),
            Spacer(flex: 3,),
            CustomTextFormField(hintText: AppStrings.title,maxLines: 1,),
            SizedBox(height: 15,),
            CustomTextFormField(hintText: AppStrings.content,maxLines: 7,),
            Spacer(flex: 6,)
          ],
        ),
      ),
    );
  }
}
