import 'package:test_gantt/extensions/int_extensions.dart';

extension DateToStringExtension on DateTime {
  String toDateTimeStr() {
    return "${year.toStrTime(4)}-${month.toStrTime(2)}-${day.toStrTime(2)}T${hour.toStrTime(2)}:${minute.toStrTime(2)}:${second.toStrTime(2)}";
  }
}

extension OnlyDateToStringExtension on DateTime {
  String onlyDateToStr() {
    return "${year.toStrTime(4)}-${month.toStrTime(2)}-${day.toStrTime(2)}";
  }
}

extension OnlyTimeToStringExtension on DateTime {
  String onlyTimeToStr() {
    return "${hour.toStrTime(2)}:${minute.toStrTime(2)}:${second.toStrTime(2)}";
  }
}
