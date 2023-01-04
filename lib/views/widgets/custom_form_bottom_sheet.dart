import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/cubit/add_note_cubit/add_notes_cubit.dart';
import 'package:my_notes_app/cubit/notes_cubit/notes_cubit.dart';
import '../../cubit/add_note_cubit/add_notes_state.dart';
import 'custom_form_notes.dart';

class CustomFormBottomSheet extends StatelessWidget {
  const CustomFormBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if (state is AddNotesSuccess) {
            Navigator.pop(context);
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          } else if (state is AddNotesFailure) {
            debugPrint("error: ${state.errorMessage}");
          }
        },
        builder: (context, state) {
          return Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(
                child: CustomFormNotes(),
              ));
        },
      ),
    );
  }
}
