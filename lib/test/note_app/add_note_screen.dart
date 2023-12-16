import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/floating_text_field.dart';
import 'package:flutter_task_3/core/presentation/widgets/general_app_bar.dart';
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
      appBar: GeneralAppBar(title: 'Add New Note'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingTextField(label: 'title', controller: title),
              const SizedBox(height: 15.0),
              FloatingTextField(label: 'description', controller: desc),
              const SizedBox(height: 25.0),
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
      ),
    );
  }
}
