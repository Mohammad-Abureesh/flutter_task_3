import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/submit_button.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';
import 'package:flutter_task_3/core/utils/routing.dart';

import 'add_note_screen.dart';
import 'view_all_notes_screen.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.event_note_outlined, size: 80.0),
            TextWidget.bold(data: 'NOTE APP'),
            SizedBox(height: 120.0),
            SubmitButton(
                onPressed: Routing.of(context, AddNewNoteScreen()),
                title: 'Add new'),
            SizedBox(height: 10.0),
            SubmitButton(
                onPressed: Routing.of(context, ViewALlNotes()),
                title: 'View all'),
          ],
        ),
      ),
    );
  }
}
