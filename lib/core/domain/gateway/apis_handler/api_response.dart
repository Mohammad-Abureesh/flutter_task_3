class ApiResponse<R> {
  R? data;

  String? _error;

  bool success;

  ApiResponse({this.data, this.success = false, String? error})
      : _error = error;

  R dataOrDefault(R value) => data ?? value;
  String get error => _error ?? '';

  set error(String? value) => _error = value;
}
