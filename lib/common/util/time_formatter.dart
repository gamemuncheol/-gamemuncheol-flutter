class TimeFormatter {
  TimeFormatter._();

  static String formatDateTime(String utcDateTimeString) {
    DateTime dateTime = DateTime.parse(utcDateTimeString);

    String year = (dateTime.year % 100).toString();
    String month = dateTime.month.toString().padLeft(2, "0");
    String day = dateTime.day.toString().padLeft(2, "0");

    return "$year. $month. $day";
  }
}
