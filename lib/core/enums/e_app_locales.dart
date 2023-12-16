///All supported locales
///

const defaultLocale = AppLocales.en;

enum AppLocales {
  en('English', 'US'),
  ar('Arabic', 'SA'),
  fr('French', 'FR'),
  de('German', 'DE'),
  ja('Japanese', 'JP'),
  tr('Turkish', 'TR');

  const AppLocales(this.displayName, this.code);
  final String displayName;
  final String code;

  ///To return flag uri
  String get flag => 'https://flagsapi.com/$code/flat/64.png';

  factory AppLocales.findOrDefault(String? code) {
    if (code == null) return defaultLocale;
    if (code.isEmpty) return defaultLocale;
    return values.firstWhere((locale) => locale.code == code,
        orElse: () => defaultLocale);
  }
}
