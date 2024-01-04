import 'package:intl/intl.dart';

class DayFormat {
  static getDay(DateTime date) {
    return DateFormat(
      'EEE, MMMM d',
    ).format(date);
  }
}
