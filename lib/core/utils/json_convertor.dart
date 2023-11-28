typedef ObjectConvertorFromJson<R> = R Function(Map<String, dynamic> json);

class JsonConvertor<R> {
  ///To convert list of json to nullable iterable of <R?>[]
  ///
  /// [jsonData] must be list of <Map<String,dynamic>>[]
  ///
  /// [convertor] convert Map<String,dynamic> to object from [R]
  ///
  ///   ex: jsonData:[{...}] , convertor: Sample.fromMap
  Iterable<R?>? nullableIterable(
      dynamic jsonData, ObjectConvertorFromJson<R> convertor) {
    try {
      if (jsonData == null || jsonData is! List) return null;
      return jsonData.map((e) => _object(e, convertor));
    } catch (e) {
      return null;
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
