import 'package:flutter/material.dart';

import 'custom_notes_card.dart';

class MyListOfNotesCards extends StatelessWidget {
  const MyListOfNotesCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: 10,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => const CustomNotesCard(),
        ),
      ),
    );
  }
}