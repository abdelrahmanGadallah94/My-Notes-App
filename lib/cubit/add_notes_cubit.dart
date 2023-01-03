import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_notes_app/model/notes_model.dart';

import '../views/settings/app_strings.dart';
part 'add_notes_state.dart';

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
}
