import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_notes_app/views/screens/edit_notes_screen.dart';
import 'package:my_notes_app/views/screens/notes_home_screen.dart';
import 'package:my_notes_app/views/settings/app_routes.dart';
void main() async{
  await Hive.initFlutter();
  await Hive.openBox('Notes');
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.homeNotesRoute: (context) => const HomeNotesScreen(),
        AppRoutes.editNotesRoute: (context) => const EditNotesScreen(),
      },
      initialRoute: AppRoutes.homeNotesRoute,
      theme: ThemeData(
        brightness: Brightness.dark
      ),
    );
  }
}

