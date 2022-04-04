class SpaceRemover {
  //Removes spaces at the end of a string
  static String _endSpaceRemover(String string) {
    for (int i = string.length; i >= 0; i--) {
      if (string[i - 1] != ' ') {
        string = string.substring(0, i);
        break;
      }
      continue;
    }
    return string;
  }

  //Removes all spaces from the string
  static String _removeAllSpaces(String string) {
    return string.replaceAll(' ', '');
  }

  //Removes all spaces from the beginning to the end of the string
  static String removeSpaces(String string) {
    return _endSpaceRemover(_removeAllSpaces(string));
  }
}
