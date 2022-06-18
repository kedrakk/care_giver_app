import 'package:intl/intl.dart';

extension AlarmTime on String {
  String toTimeOnly() {
    return DateFormat("").add_jm().format(DateFormat('hh:mm:ss').parse(this));
  }
}
