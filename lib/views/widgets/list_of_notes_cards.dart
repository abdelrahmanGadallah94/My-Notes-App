import 'package:flutter/material.dart';
import 'package:my_notes_app/views/settings/app_routes.dart';

import 'custom_notes_card.dart';

class MyListOfNotesCards extends StatelessWidget {
  const MyListOfNotesCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView.builder(
          itemCount: 10,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => InkWell(
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.editNotesRoute);
            },
            child: const CustomNotesCard(),
          ),
        ),
      ),
    );
  }
}