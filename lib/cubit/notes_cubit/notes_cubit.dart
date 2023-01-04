import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:my_notes_app/views/settings/app_strings.dart';
import '../../model/notes_model.dart';
import '../../views/settings/app_colors.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NotesModel>? notes;

  // show notes method
  fetchAllNotes() {
      var note = Hive.box<NotesModel>(AppStrings.kNotesBox);
      notes = note.values.toList();
      emit(NotesSuccess());

  }

  //edit notes (title and content)
  void editNotesMethod(NotesModel note, TextEditingController title,
      TextEditingController content, BuildContext context) async{
    note.title = title.text.isEmpty ? note.title : title.text;
    note.subtitle = content.text.isEmpty ? note.subtitle : content.text;
    await note.save();
    // ignore: use_build_context_synchronously
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  // edit notes colors
  void editNotesColors(int index,note,setState) {
   note.colors = AppColors.kNotesColor[index].value;
    note.save();
    setState(() {});
  }

}
