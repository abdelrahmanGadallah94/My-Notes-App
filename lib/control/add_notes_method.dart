import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/cubit/notes_cubit/notes_cubit.dart';

import '../cubit/add_note_cubit/add_notes_cubit.dart';
import '../model/notes_model.dart';
import '../views/settings/app_colors.dart';

void addNotesMethod(String? title, String? subtitle, BuildContext context,
    formKey, autoValidateMode,setState) {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    DateTime currentDate = DateTime.now();
    NotesModel note = NotesModel(
        title: title!,
        subtitle: subtitle!,
        date: DateTime.now().toString(),
        colors: AppColors.kCustomCardColor.value);
    BlocProvider.of<AddNotesCubit>(context).addNotesMethod(note);
  } else {
    autoValidateMode = AutovalidateMode.always;
    setState(() {});
  }
}
