import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:my_notes_app/model/notes_model.dart';
import '../../views/settings/app_colors.dart';
import '../../views/settings/app_strings.dart';
import 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  addNotesMethod(NotesModel note) async{
    emit(AddNotesLoading());
    try{
      var notesBox =  Hive.box<NotesModel>(AppStrings.kNotesBox);
      await notesBox.add(note);
      emit(AddNotesSuccess());
    }catch(e){
      emit(AddNotesFailure(
        errorMessage: e.toString()
      ));
    }
  }

  void addNotesMethodAndValidation(String? title, String? subtitle, BuildContext context,
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
}
