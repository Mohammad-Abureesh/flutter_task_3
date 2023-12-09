part of app_style;

abstract class Pallet {
  static const Color primary = Color(0xff6F4BF2);
  static const Color secondary = Color(0xff302559);
  static const Color lightPurple = Color(0xff977EF2);
  static const Color lightGrey = Color(0xffF2F2F2);

  static const Color lightBlack = Color(0xff0D0D0D);
  static const Color silver = Color(0xffB4BBBF);

  static List<Color> get productColors {
    return [Colors.black, Colors.grey, secondary, primary];
  }
}
