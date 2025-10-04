import 'package:intl/intl.dart';

class ContactUtils {

  static String formattedNumber(int number) {
    String formattedNumber = NumberFormat('#,###').format(number);
    return formattedNumber;
  }
}
