import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/cubit/add_notes_cubit.dart';
import 'package:my_notes_app/model/notes_model.dart';

import '../../control/validation_method.dart';
import '../settings/app_colors.dart';
import '../settings/app_strings.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class CustomFormNotes extends StatefulWidget {
  const CustomFormNotes({Key? key}) : super(key: key);

  @override
  State<CustomFormNotes> createState() => _CustomFormNotesState();
}

class _CustomFormNotesState extends State<CustomFormNotes> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    String ?title, subtitle;
    return Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              onSaved: (data) {
                title = data;
              },
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
              onSaved: (data) {
                subtitle = data;
              },
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
                validation(formKey, autoValidateMode);
                NotesModel note = NotesModel(title: title!, subtitle: subtitle!, date: DateTime.now().toString(), colors: AppColors.kCustomCardColor.value);
                BlocProvider.of<AddNotesCubit>(context).addNotesMethod(note);
              },
            ),
          ],
        ));
  }
}
