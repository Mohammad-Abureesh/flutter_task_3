part of app_style;

abstract class Pallet {
  static const primary = Color(0xff6F4BF2);
  static const secondary = Color(0xff302559);
  static const lightPurple = Color(0xff977EF2);
  static const lightGrey = Color(0xffF2F2F2);

  static List<Color> get productColors {
    return [Colors.black, Colors.grey, secondary, primary];
  }
}
