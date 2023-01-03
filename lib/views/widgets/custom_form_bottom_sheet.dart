import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/cubit/add_notes_cubit.dart';
import 'custom_form_notes.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class CustomFormBottomSheet extends StatelessWidget {
  const CustomFormBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNotesCubit,AddNotesState>(
        builder: (context,state){
          return Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ModalProgressHUD(
                inAsyncCall: state is AddNotesLoading ? true : false,
                child: const SingleChildScrollView(
                  child: CustomFormNotes(),
                )
            ),
          );
        },
        listener: (context, state) {
          if(state is AddNotesSuccess){
            Navigator.pop(context);
          }else if(state is AddNotesFailure){
            debugPrint("error: ${state.errorMessage}");
          }
        },
    );
  }
}