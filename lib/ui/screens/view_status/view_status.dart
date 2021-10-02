import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/data/models/status_item.dart';
import 'package:whatsapp/ui/screens/view_status/view_status_controller.dart';
import 'package:whatsapp/ui/screens/view_status/widgets/status_view_bar/status_view_bar.dart';

class ViewStatus extends StatefulWidget {
  final List<StatusItem> status;
  ViewStatus({Key? key, required this.status}) : super(key: key);

  @override
  _ViewStatusState createState() => _ViewStatusState();
}

class _ViewStatusState extends State<ViewStatus> with TickerProviderStateMixin{
  final _controller = Get.put(ViewStatusController());

  @override
  void dispose() {
    super.dispose();
    _controller.onClose();
  }

  @override
  Widget build(BuildContext context) {
    final List<StatusViewBarHolder> listStatusViewBar = List.generate(widget.status.length, (index) => StatusViewBarHolder(
      animationController: AnimationController(vsync: this, duration: Duration(seconds: 15))..addListener(() {
        _controller.update(['time']);
      }),
    )).toList();
    return SafeArea(
      child: PageView.builder(
        itemCount: widget.status.length,
        onPageChanged: (value) {
          listStatusViewBar[value].init();
          listStatusViewBar[value-1].nextStatus();
          listStatusViewBar[value+1].backStatus();
          listStatusViewBar[value+1].verNovamente();
        },
        itemBuilder: (context, index) {
          return GetBuilder<ViewStatusController>(
            init: _controller,
            id: 'show-status-item',
            builder: (controller) => Dismissible(
              direction: DismissDirection.down,
              confirmDismiss: (direction) async {
                listStatusViewBar[index].close();
                Navigator.pop(context);
              },
              key: ValueKey<StatusItem>(widget.status[index]),
              child: GestureDetector(
                onTapDown: (_) => listStatusViewBar[index].stop(),
                onTapUp: (_) => listStatusViewBar[index].resume(),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                                children: List.generate(widget.status.length, (indexStatusViewBar) => Expanded(
                                  child: listStatusViewBar[indexStatusViewBar].widget,
                                )).fold(<Widget>[], (previousValue, element){
                                  previousValue.isEmpty? previousValue.add(element):previousValue.addAll([SizedBox(width: 5,), element]);
                                  return previousValue;
                                })
                            )
                        ),
                      ),
                      Align(child: Image.network(widget.status[index].data), alignment: Alignment.center,),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
