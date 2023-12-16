import 'package:flutter/material.dart';

import 'note_entity.dart';
import 'notes_data.dart';

class AllNotesController with ChangeNotifier {
  List<Note> notes = [];

  void load() async {
    notes = await NotesRepository().readAll();
    notifyListeners();
  }

  void onUpdateNoteStatus(Note note, bool? value) async {
    value ??= false;
    note.status = value ? NoteStatus.completed : NoteStatus.unCompleted;
    await NotesRepository().updateNote(note);
    load();
  }
}
