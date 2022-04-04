import 'package:truyou/components/components.dart';

///Provides userful date utility functions
class DateHelper {
  //Converts the month in an INT form to the Month in a STRING (02 -> February)
  static String _convertNumMonthToWord(DateTime date) {
    return Constants.months[date.month - 1];
  }

  static DateTime _convertWordToNum(String month) {
    int _monthIndex = 0;
    for (String strMont in Constants.months) {
      if (strMont == month) break;
      _monthIndex++;
    }
    return DateTime(1000, _monthIndex, 01);
  }

  //!Used for testing
  static DateTime standardDateToDate(String date) {
    String removedSpacesDate = SpaceRemover.removeSpaces(date);
    return DateTime(
        int.parse(removedSpacesDate.substring(0, 2)),
        _convertWordToNum(removedSpacesDate.substring(2, -4)).month,
        int.parse(removedSpacesDate.substring(-4)));
  }

  //Converts a DateTime date into a standard date (12/02/2020 -> 12 February 2020)
  static String dateToStandardDate(DateTime date) {
    String? month = _convertNumMonthToWord(date);
    return '${date.day} $month ${date.year}';
  }

  //Returns age from birth date
  static int getAge(DateTime birthDate) {
    return (DateTime.now().difference(birthDate).inDays ~/ 365).toInt();
  }
}
