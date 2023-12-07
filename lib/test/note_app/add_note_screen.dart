import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/floating_text_field.dart';
import 'package:flutter_task_3/core/presentation/widgets/submit_button.dart';

import 'note_entity.dart';
import 'notes_data.dart';

class AddNewNoteScreen extends StatelessWidget {
  AddNewNoteScreen({super.key});

  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            child: Column(
          children: [
            FloatingTextField(label: 'title', controller: title),
            FloatingTextField(label: 'description', controller: desc),
            SubmitButton(
              title: 'Add new',
              onPressed: () async {
                await NotesRepository()
                    .saveNote(Note.create(title.text, desc.text));
                title.clear();
                desc.clear();
              },
            )
          ],
        )),
      ),
    );
  }
}
