class Time {
  final DateTime time;

  Time(this.time);

  String get formattedHour => time.hour.toString().padLeft(2, '0');
  String get formattedMinute => time.minute.toString().padLeft(2, '0');
  String get formattedTime => '$formattedHour:$formattedMinute';
}
