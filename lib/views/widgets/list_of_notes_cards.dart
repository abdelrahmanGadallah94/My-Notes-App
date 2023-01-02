import 'package:flutter/material.dart';

import 'custom_notes_card.dart';

class MyListOfNotesCards extends StatelessWidget {
  const MyListOfNotesCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .8,
      child: ListView.builder(
        itemBuilder: (context, index) => const CustomNotesCard(),
      ),
    );
  }
}