import 'package:flutter/material.dart';
import 'custom_form_notes.dart';

class CustomFormBottomSheet extends StatelessWidget {
  const CustomFormBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: const SingleChildScrollView(
        child: CustomFormNotes(),
      ),
    );
  }
}