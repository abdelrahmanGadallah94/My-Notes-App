import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:my_notes_app/model/notes_model.dart';
import 'package:my_notes_app/views/settings/app_routes.dart';
import 'custom_notes_card.dart';

class MyListOfNotesCards extends StatefulWidget {
  const MyListOfNotesCards({Key? key}) : super(key: key);

  @override
  State<MyListOfNotesCards> createState() => _MyListOfNotesCardsState();
}

class _MyListOfNotesCardsState extends State<MyListOfNotesCards> {
  @override
  Widget build(BuildContext context) {
    // List<NotesModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NotesModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) =>
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.editNotesRoute);
                    },
                    child:  CustomNotesCard(
                      note: notes[index],
                    ),
                  ),
            ),
          ),
        );
      },
    );
  }
}
