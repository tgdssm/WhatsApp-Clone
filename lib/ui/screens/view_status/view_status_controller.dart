import 'package:get/get.dart';
import 'package:whatsapp/data/models/status_item.dart';

class ViewStatusController extends GetxController {
  bool isDown = false;
  late StatusItem statusItem;

  void play({required List<StatusItem> status}){
    statusItem = status.firstWhere((element) => !element.shown);
    update(['show-status-item']);
  }
}