import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/cubit/add_note_cubit/add_notes_cubit.dart';
import '../../cubit/add_note_cubit/add_notes_state.dart';
import '../settings/app_colors.dart';
import '../settings/app_strings.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  const CustomButton({
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BlocBuilder<AddNotesCubit,AddNotesState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                color: AppColors.kCustomCardColor,
                borderRadius: BorderRadius.circular(15)
            ),
            child:  state is AddNotesLoading ? const CircularProgressIndicator(
              color: AppColors.kWhiteColor,
            ): const Text(
            AppStrings.addNotes,
            style: TextStyle(fontSize: 18),
          ),
          );
        },
      ),
    );
  }
}