import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_notes_app/cubit/add_notes_cubit.dart';
import 'package:my_notes_app/simple_bloc_observer.dart';
import 'package:my_notes_app/views/screens/edit_notes_screen.dart';
import 'package:my_notes_app/views/screens/notes_home_screen.dart';
import 'package:my_notes_app/views/settings/app_routes.dart';
import 'package:my_notes_app/views/settings/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model/notes_model.dart';

void main() async{
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>(AppStrings.kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.homeNotesRoute: (context) => const HomeNotesScreen(),
          AppRoutes.editNotesRoute: (context) => const EditNotesScreen(),
        },
        initialRoute: AppRoutes.homeNotesRoute,
        theme: ThemeData(
            brightness: Brightness.dark
        ),
      ),

    );
  }
}

