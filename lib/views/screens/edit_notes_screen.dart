import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:my_notes_app/model/notes_model.dart';

import '../widgets/custom_edit_note_color.dart';
import '../widgets/custom_edit_notes_app_bar.dart';
import '../widgets/custom_text_form_field.dart';

class EditNotesScreen extends StatelessWidget {
  const EditNotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController content = TextEditingController();
    NotesModel note = ModalRoute.of(context)!.settings.arguments as NotesModel;
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {

      },
      builder: (context,state) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
          child: Column(
            children:  [
               CustomEditNotesAppBar(
                 onPressed: () {
                   BlocProvider.of<NotesCubit>(context).editNotesMethod(note, title, content, context);
                 },
               ),
              const Spacer(flex: 3,),
              CustomTextFormField(
                hintText: note.title, maxLines: 1,
                controller: title,
              ),
              const SizedBox(height: 15,),
              CustomTextFormField(
                controller: content,
                hintText: note.subtitle, maxLines: 7,
              ),
              const SizedBox(height: 20,),
              CustomEditNotesColor(note: note),
              const Spacer(flex: 6,)
            ],
          ),
        ),
      ),
    );
  }

}
