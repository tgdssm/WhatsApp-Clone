import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/ui/screens/view_status/view_status_controller.dart';

class StatusViewBar extends StatefulWidget {
  final AnimationController animationController;
  StatusViewBar({Key? key, required this.animationController}) : super(key: key);

  @override
  _StatusViewBarState createState() => _StatusViewBarState();
}

class _StatusViewBarState extends State<StatusViewBar> {
  final _controller = Get.find<ViewStatusController>();

  void init(){ 
    widget.animationController.forward();
  }

  void nextStatus(){
    widget.animationController.forward(from: 1);
  }

  void backStatus() {
    widget.animationController.reset();
  }

  void seeAgain() {
    widget.animationController.reset();
    widget.animationController.forward();
  }

  void stop(){
    widget.animationController.stop(canceled: false);
  }

  void resume() {
    widget.animationController.forward(from: widget.animationController.value);
  }

  void close() {
    widget.animationController.reset();
    widget.animationController.dispose();
  }

  bool isCompleted() {
    return widget.animationController.isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewStatusController>(
      init: _controller,
      id: 'time',
      builder: (controller) => LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        backgroundColor: Colors.grey,
        value: widget.animationController.value,
        minHeight: 5,
      ),
    );
  }
}

class StatusViewBarHolder {
  final _key = GlobalKey<_StatusViewBarState>();
  late StatusViewBar widget;
  late AnimationController animationController;
  StatusViewBarHolder({required this.animationController}){
    widget = StatusViewBar(key: _key, animationController: animationController,);
  }

  void stop(){
    this._key.currentState!.stop();
  }

  void resume(){
    this._key.currentState!.resume();
  }

  void close(){
    this._key.currentState!.close();
  }

  void nextStatus(){
    this._key.currentState!.nextStatus();
  }

  void backStatus(){
    this._key.currentState!.backStatus();
  }

  void init(){
    this._key.currentState!.init();
  }

  void seeAgain(){
    this._key.currentState!.seeAgain();
  }

  bool isCompleted(){
    return this._key.currentState!.isCompleted();
  }





}
