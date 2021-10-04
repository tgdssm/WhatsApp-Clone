class StatusItem {
  late String userName;
  late String time;
  late int duration;
  late bool shown;
  late dynamic data;

  StatusItem({required this.userName, required this.time, required this.data, this.shown = false, this.duration = 5});
}