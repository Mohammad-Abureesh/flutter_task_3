part of app_style;

class LightTheme {
  ThemeData theme = ThemeData(
      primaryColor: Pallet.primary,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Pallet.primary)),
      outlinedButtonTheme: const OutlinedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.black))),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Pallet.primary,
          unselectedItemColor: Colors.grey.shade400));
}
