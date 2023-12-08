import 'package:flutter/material.dart';

class NotificationEntity {
  String title;
  String description;

  String? _date;

  int? _iconLogo;

  NotificationEntity(this.title, this.description, this._date, this._iconLogo);
  factory NotificationEntity.fromJson(Map<String, dynamic> json) {
    return NotificationEntity(json['title'] ?? '', json['description'] ?? '',
        json['date'].toString(), int.tryParse(json['logo'].toString()));
  }

  String get date => _date ?? '';

  IconData get icon {
    if (_iconLogo == null) return Icons.notifications;
    return IconData(_iconLogo!, fontFamily: 'MaterialIcons');
  }
}
