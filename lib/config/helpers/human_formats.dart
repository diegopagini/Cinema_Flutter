import 'package:intl/intl.dart';

class HumanFormats {
  static String humanRedableNumber(double number) {
    return NumberFormat.compact().format(number);
  }
}
