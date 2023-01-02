import 'package:flutter/material.dart';
import '../widgets/custom_notes_app_bar.dart';

class HomeNotesScreen extends StatelessWidget {
  const HomeNotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: const [
            CustomNotesAppBar(),
          ],
        ),
      )),
    );
  }
}


