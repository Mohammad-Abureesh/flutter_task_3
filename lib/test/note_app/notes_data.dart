import 'dart:convert';

import 'package:flutter_task_3/core/utils/json_convertor.dart';
import 'package:flutter_task_3/core/utils/storage_utils.dart';

import 'note_entity.dart';

String nKey = 'nkey';

class NotesRepository {
  static List<Note> all = [];

  Future<void> saveNote(Note note) async {
    all.add(note);
    await _refreshData();
  }

  Future<void> _refreshData() async {
    await _saveAllToStorage();
    await readAll();
  }

  Future<void> _saveAllToStorage() async {
    String data = jsonEncode(all.map((e) => e.toJson).toList());
    await StorageUtils.storage.setString(nKey, data);
  }

  Future<List<Note>> readAll() async {
    String? data = StorageUtils.storage.getString(nKey);
    if (data == null) return [];
    all = [];
    final json = jsonDecode(data);
    all = JsonConvertor()
            .nullableIterable(json, Note.fromJson)
            ?.whereType<Note>()
            .toList() ??
        [];
    return all;
  }

  Future<void> updateNote(Note note) async {
    if (all.isEmpty) return;
    all[all.indexOf(note)] = note;
    await _refreshData();
  }
}
