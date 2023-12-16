import 'package:flutter/cupertino.dart';
import 'package:flutter_task_3/core/constants/storage_keys.dart';
import 'package:flutter_task_3/core/enums/e_app_locales.dart';
import 'package:flutter_task_3/core/utils/storage_utils.dart';

class LanguageScreenController with ChangeNotifier {
  AppLocales selected = defaultLocale;

  void init() {
    _readAppLocale();
    notifyListeners();
  }

  void _readAppLocale() {
    var code = StorageUtils.storage.getString(StorageKeys.locale);
    selected = AppLocales.findOrDefault(code);
  }

  void onChangeLocale(AppLocales? value) {
    if (value == null) return;
    if (value == selected) return;
    selected = value;
    StorageUtils.storage.setString(StorageKeys.locale, value.code);
    notifyListeners();
  }
}
