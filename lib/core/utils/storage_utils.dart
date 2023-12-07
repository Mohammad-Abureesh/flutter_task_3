import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  static final StorageUtils _utils = StorageUtils._();
  StorageUtils._();

  late final SharedPreferences _preferences;

  static SharedPreferences get storage => _utils._preferences;

  static Future<void> ensureInit() async {
    _utils._preferences = await SharedPreferences.getInstance();
  }
}
