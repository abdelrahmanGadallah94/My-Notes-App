import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/add_note_cubit/add_notes_cubit.dart';
import '../model/notes_model.dart';
import '../views/settings/app_colors.dart';
import 'package:intl/intl.dart';

void addNotesMethod(String? title, String? subtitle, BuildContext context,
    formKey, autoValidateMode,setState) {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat.Hm().format(currentDate);
    NotesModel note = NotesModel(
        title: title!,
        subtitle: subtitle!,
        date: formattedDate,
        colors: AppColors.kCustomCardColor.value);
    BlocProvider.of<AddNotesCubit>(context).addNotesMethod(note);
  } else {
    autoValidateMode = AutovalidateMode.always;
    setState(() {});
  }
}
