import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/utils/routing.dart';

import 'add_note_screen.dart';
import 'view_all_notes_screen.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
              onPressed: Routing.of(context, AddNewNoteScreen()),
              child: const Text('Add new')),
          TextButton(
              onPressed: Routing.of(context, ViewALlNotes()),
              child: const Text('View all')),
        ],
      ),
    );
  }
}
