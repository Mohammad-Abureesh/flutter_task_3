import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/style/app_style.dart';
import 'package:flutter_task_3/core/presentation/widgets/empty_list_view.dart';
import 'package:flutter_task_3/core/presentation/widgets/general_app_bar.dart';

import 'all_notes_controller.dart';
import 'note_entity.dart';

class ViewALlNotes extends StatefulWidget {
  ViewALlNotes({super.key}) : controller = AllNotesController();

  final AllNotesController controller;
  @override
  State<ViewALlNotes> createState() => _ViewALlNotesState();
}

class _ViewALlNotesState extends State<ViewALlNotes> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });

    widget.controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: 'All Notes'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: widget.controller.notes.isEmpty
            ? const EmptyListView()
            : ListView(
                children: widget.controller.notes.map(_builder).toList()),
      ),
    );
  }

  Widget _builder(Note note) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          activeColor: Pallet.primary,
          value: note.status == NoteStatus.completed,
          onChanged: (v) => widget.controller.onUpdateNoteStatus(note, v),
        ),
        title: Text(note.title),
        subtitle: Text('\n${note.description}\n${note.date}'),
      ),
    );
  }
}
