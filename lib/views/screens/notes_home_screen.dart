import 'package:flutter/material.dart';
import 'package:my_notes_app/views/settings/app_colors.dart';
import 'package:my_notes_app/views/settings/app_strings.dart';
import '../widgets/custom_form_bottom_sheet.dart';
import '../widgets/custom_notes_app_bar.dart';
import '../widgets/list_of_notes_cards.dart';

class HomeNotesScreen extends StatelessWidget {
  const HomeNotesScreen({Key? key}) : super(key: key);
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
