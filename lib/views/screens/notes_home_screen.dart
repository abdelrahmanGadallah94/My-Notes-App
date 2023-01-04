import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/views/settings/app_colors.dart';
import 'package:my_notes_app/views/settings/app_strings.dart';
import '../../cubit/notes_cubit/notes_cubit.dart';
import '../widgets/custom_form_bottom_sheet.dart';
import '../widgets/custom_notes_app_bar.dart';
import '../widgets/list_of_notes_cards.dart';


class HomeNotesScreen extends StatefulWidget {
  const HomeNotesScreen({Key? key}) : super(key: key);

  @override
  State<HomeNotesScreen> createState() => _HomeNotesScreenState();
}

class _HomeNotesScreenState extends State<HomeNotesScreen> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            builder: (context) => const CustomFormBottomSheet(),
          );
        },
        child: const Text(
          AppStrings.plus,
          style: TextStyle(
              fontSize: 25,
              color: AppColors.kCustomCardColor
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 60),
        child: Column(
          children: const [
            CustomNotesAppBar(),
            MyListOfNotesCards(),
          ],
        ),
      ),
    );
  }
}
