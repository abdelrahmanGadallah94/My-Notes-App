import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:my_notes_app/model/notes_model.dart';

class CustomNotesCard extends StatelessWidget {
  final NotesModel note;
  const CustomNotesCard({
    required this.note,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15,bottom: 15,left: 15),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Color(note.colors),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title:  Text(
              note.title,
              style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
            ),
            subtitle:  Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                note.subtitle,
                style: const TextStyle(height: 1.4),
              ),
            ),
            trailing: IconButton(onPressed: (){
              note.delete();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            }, icon: const Icon(Icons.delete_sharp)),

          ),
           Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(note.date)
          ),
        ],
      ),
    );
  }
}