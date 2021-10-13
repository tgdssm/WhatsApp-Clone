import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
  late List<StatusViewBarHolder> _listStatusViewBar;
  bool _completed = false;
  int _indexStatus = 0;

  void _skipToTheNext() {
    _listStatusViewBar[_indexStatus].nextStatus();
    _indexStatus++;
    _listStatusViewBar[_indexStatus].init();
  }

  void _backToPrevious() {
    _listStatusViewBar[_indexStatus].backStatus();
    _indexStatus--;
    _listStatusViewBar[_indexStatus].seeAgain();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listStatusViewBar = List.generate(widget.status.length, (index) => StatusViewBarHolder(
      animationController: AnimationController(vsync: this, duration: Duration(seconds: widget.status[index].duration))..addListener(() {
        _completed = _listStatusViewBar[_indexStatus].isCompleted();
        _controller.update(['time',]);
      }),
    )).toList();

    _controller.goToNextAutomaticStatus = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if(_completed){
        if(_indexStatus < _listStatusViewBar.length - 1) {
          this._skipToTheNext();
        } else {
          timer.cancel();
          Navigator.pop(context);
        }
        _controller.update(['show-status-item']);
      }
    });
  }

  @override
  void dispose() {
    _controller.onClose();
    _controller.goToNextAutomaticStatus.cancel();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _listStatusViewBar[_indexStatus].init();
    });
    return SafeArea(
      child: GetBuilder<ViewStatusController>(
        init: _controller,
        id: 'show-status-item',
        builder: (controller) => Dismissible(
          direction: DismissDirection.down,
          confirmDismiss: (direction) async {
            _listStatusViewBar[_indexStatus].close();
            Navigator.pop(context);
          },
          key: ValueKey<StatusItem>(widget.status[_indexStatus]),
          child: GestureDetector(
            onTapDown: (_) => _listStatusViewBar[_indexStatus].stop(),
            onTapUp: (details) {
              if(details.globalPosition.dx > 330){
                if(_indexStatus < _listStatusViewBar.length - 1) {
                  this._skipToTheNext();
                } else {
                  _listStatusViewBar[_indexStatus].close();
                  Navigator.pop(context);
                }
              } else if(details.globalPosition.dx < 55){
                if(_indexStatus > 0){
                  this._backToPrevious();
                }
              } else{
                _listStatusViewBar[_indexStatus].resume();
              }
              _controller.update(['show-status-item']);
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                              children: List.generate(widget.status.length, (indexStatusViewBar) => Expanded(
                                child: _listStatusViewBar[indexStatusViewBar].widget,
                              )).fold(<Widget>[], (previousValue, element){
                                previousValue.isEmpty? previousValue.add(element):previousValue.addAll([SizedBox(width: 5,), element]);
                                return previousValue;
                              })
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Material(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(),
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_back),
                                    onPressed: () {
                                      _listStatusViewBar[_indexStatus].close();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(widget.status[_indexStatus].data),
                                    fit: BoxFit.cover
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(widget.status[_indexStatus].userName, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500
                                    ),),),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(widget.status[_indexStatus].time, style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300
                                    ),),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(child: Align(child: Image.network(widget.status[_indexStatus].data, fit: BoxFit.cover,), alignment: Alignment.center,),
                      height: MediaQuery.of(context).size.height * .8,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
