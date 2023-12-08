import 'dart:convert';

import 'package:flutter/services.dart';

///Load from test assets folder
class FetchTestJson {
  final String file;

  FetchTestJson(this.file);

  Future<Map<String, dynamic>> get fetchData async {
    final String response =
        await rootBundle.loadString('assets/test/$file.json');
    return Map.from(await json.decode(response));
  }
}
