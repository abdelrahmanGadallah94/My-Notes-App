import 'package:flutter/material.dart';
import '../../control/add_notes_method.dart';
import '../settings/app_strings.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class CustomFormNotes extends StatefulWidget {
  const CustomFormNotes({Key? key}) : super(key: key);

  @override
  State<CustomFormNotes> createState() => _CustomFormNotesState();
}

class _CustomFormNotesState extends State<CustomFormNotes> {

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              controller: title,
              validator: (data) {
                if (data?.isEmpty ?? true) {
                  return AppStrings.requiredField;
                }
                return null;
              },
              hintText: AppStrings.title,
              maxLines: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              controller: content,
              validator: (data) {
                if (data?.isEmpty ?? true) {
                  return AppStrings.requiredField;
                }
                return null;
              },
              hintText: AppStrings.content,
              maxLines: 7,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              onTap: () {
                addNotesMethod(title.text, content.text, context,formKey,autoValidateMode,setState);
              },
            ),
          ],
        ));
  }


}
