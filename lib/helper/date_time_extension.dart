extension DateTimeExtension on DateTime {
  static DateTime fromTime(String time) {
    List<String> timeParts = time.split(':');
    return DateTime(
      0,
      1,
      1,
      int.parse(timeParts[0]),
      int.parse(timeParts[1]),
      int.parse(timeParts[2]),
    );
  }

  DateTime toTime() {
    return DateTime(0, 1, 1, hour, minute, second);
  }

  DateTime toDate() {
    return DateTime(year, month, day, 0, 0, 0);
  }
}
