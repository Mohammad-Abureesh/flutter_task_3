import 'package:flutter/material.dart';

import 'note_entity.dart';
import 'notes_data.dart';

class AllNotesController with ChangeNotifier {
  List<Note> notes = [];

  void load() async {
    notes = await NotesRepository().readAll();
    notifyListeners();
  }
}
