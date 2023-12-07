import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/empty_list_view.dart';

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
      appBar: AppBar(),
      body: widget.controller.notes.isEmpty
          ? const EmptyListView()
          : ListView(children: widget.controller.notes.map(_builder).toList()),
    );
  }

  Widget _builder(Note note) {
    return Card(
      child: Text('''
      ${note.title}
      ${note.description}
      ${note.date}
      '''),
    );
  }
}
