part of app_style;

class LightTheme {
  ThemeData theme = ThemeData(
      primaryColor: Pallet.primary,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Pallet.primary,
          unselectedItemColor: Colors.grey.shade400));
}
