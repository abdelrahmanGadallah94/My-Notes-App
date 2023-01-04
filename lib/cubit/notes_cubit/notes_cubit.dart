import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:my_notes_app/views/settings/app_strings.dart';
import '../../model/notes_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NotesModel>? notes;
  fetchAllNotes() {
    try{
      var note = Hive.box<NotesModel>(AppStrings.kNotesBox);
      notes = note.values.toList();
      emit(NotesSuccess());
    }catch (e){
      debugPrint(e.toString());
    }
  }
}
