class StringUtils {
  static String capitalizeAndJoin(String input) {
    List<String> words = [];
    String currentWord = '';

    for (int i = 0; i < input.length; i++) {
      if (i > 0 && input[i] == input[i].toUpperCase()) {
        words.add(currentWord);
        currentWord = input[i];
      } else {
        currentWord += input[i];
      }
    }

    words.add(currentWord);
    return words
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}
