import 'package:flutter_task_3/core/domain/repositories/users_repository.dart';

enum NoteStatus {
  completed,
  unCompleted;

  factory NoteStatus.find(int? status) {
    return values.firstWhereOrNull((e) => e.index == status) ?? unCompleted;
  }
}

class Note {
  String title;
  String description;
  DateTime date;

  int? _status;

  Note.create(this.title, this.description)
      : date = DateTime.now(),
        _status = NoteStatus.unCompleted.index;
  Note._(this.title, this.description, this.date, this._status);

  Map<String, dynamic> get toJson {
    return {
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'status': _status
    };
  }

  set status(NoteStatus value) {
    _status = value.index;
  }

  NoteStatus get status => NoteStatus.find(_status);

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note._(
        json['title'] ?? '',
        json['description'] ?? '',
        DateTime.tryParse('${json['date']}') ?? DateTime.now(),
        int.tryParse('${json['status']}'));
  }
}
