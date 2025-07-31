import 'package:intl/intl.dart';

class AppFormatters {
  static String formatPrice(double price) {
    return NumberFormat("#,##0", "en_US").format(price);
  }
  static String formatKilometers(double km) {
  return NumberFormat("#,##0", "en_US").format(km);
}

}

