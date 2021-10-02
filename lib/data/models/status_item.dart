class StatusItem {
  late String userName;
  late String time;
  late bool shown;
  late dynamic data;

  StatusItem({required this.userName, required this.time, required this.data, this.shown = false});
}