import 'package:intl/intl.dart';

class DateHelper {
  static dateToString({required DateTime date, String? format = 'dd/MM/yyyy'}) {
    if (date == null) return '';
    return DateFormat(format).format(date);
  }
}
