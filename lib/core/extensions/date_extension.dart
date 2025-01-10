import 'package:intl/intl.dart';

extension DateTimeConvertion on DateTime {
  String get toFormattedDate => DateFormat('yyyyMMdd').format(this);
  String get toFormattedTimestamp =>
      DateFormat('yyyyMMddHHmmssSSS').format(this);
}
