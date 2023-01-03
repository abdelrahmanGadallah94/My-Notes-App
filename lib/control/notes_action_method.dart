import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/add_notes_cubit.dart';
import '../model/notes_model.dart';
import '../views/settings/app_colors.dart';

void notesAction(String? title, String? subtitle, BuildContext context,formKey,autoValidateMode) {
  NotesModel note = NotesModel(
      title: title!,
      subtitle: subtitle!,
      date: DateTime.now().toString(),
      colors: AppColors.kCustomCardColor.value);
  BlocProvider.of<AddNotesCubit>(context).addNotesMethod(note);
}
