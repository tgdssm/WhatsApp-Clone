import 'package:flutter/material.dart';
import 'package:whatsapp/ui/screens/status_screen/status_screen.dart';

class ViewStatus extends StatelessWidget {
  final Status status;
  const ViewStatus({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Stack(
          children: [
            Align(child: Image.network(status.photo), alignment: Alignment.center,),
            Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  backgroundColor: Colors.grey,
                  value: 0.2,
                  minHeight: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
