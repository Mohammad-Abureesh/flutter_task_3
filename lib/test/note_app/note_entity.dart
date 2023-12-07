class Note {
  String title;
  String description;
  DateTime date;

  Note.create(this.title, this.description) : date = DateTime.now();
  Note._(this.title, this.description, this.date);

  Map<String, dynamic> get toJson {
    return {
      'title': title,
      'description': description,
      'date': date.toIso8601String()
    };
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note._(json['title'] ?? '', json['description'] ?? '',
        DateTime.tryParse('${json['date']}') ?? DateTime.now());
  }
}
