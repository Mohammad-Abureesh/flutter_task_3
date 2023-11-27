typedef ObjectConvertorFromJson<R> = R Function(Map<String, dynamic> json);

class JsonConvertor<R> {
  Iterable<R?> nullableIterable(
      dynamic jsonData, ObjectConvertorFromJson<R> convertor) {
    try {
      if (jsonData == null) return [];
      if (jsonData is! List) return [];

      return jsonData.map((e) => _object(e, convertor));
    } catch (e) {
      return [];
    }
  }

  R? _object(Map<String, dynamic> json, ObjectConvertorFromJson<R> convertor) {
    try {
      return convertor.call(json);
    } catch (e) {
      return null;
    }
  }
}
