import 'package:hive_flutter/adapters.dart';
part 'notes_model.g.dart';

@HiveType(typeId: 1)
class NotesModel extends HiveObject{
  @HiveField(0)
   String title;
  @HiveField(1)
   String subtitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int colors;
  NotesModel({required this.title, required this.subtitle, required this.date, required this.colors});
}