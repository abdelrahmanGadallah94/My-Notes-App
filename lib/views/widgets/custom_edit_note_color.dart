import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:my_notes_app/model/notes_model.dart';
import 'package:my_notes_app/views/settings/app_colors.dart';

class CustomEditNotesColor extends StatefulWidget {
  final NotesModel note;
  const CustomEditNotesColor({Key? key,required this.note}) : super(key: key);

  @override
  State<CustomEditNotesColor> createState() => _CustomEditNotesColorState();
}

class _CustomEditNotesColorState extends State<CustomEditNotesColor> {
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = AppColors.kNotesColor.indexOf(Color(widget.note.colors));
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: SizedBox(
        height: 68,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: AppColors.kNotesColor.length,
          itemBuilder: (context,index) =>
              Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: GestureDetector(
                    onTap: (){
                      currentIndex = index;
                      BlocProvider.of<NotesCubit>(context).editNotesColors(index,widget.note,setState);
                    },
                    child: currentIndex == index ?  CircleAvatar(
                      radius: 35,
                      backgroundColor: AppColors.kWhiteColor,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: AppColors.kNotesColor[index],
                      ),
                    )
                        : CircleAvatar(
                      radius: 34,
                      backgroundColor: AppColors.kNotesColor[index],
                    ),
                  )
              ),
        ),
      ),
    );
  }

}

