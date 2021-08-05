import 'package:flutter/material.dart';
import 'package:whatsapp/utils/globals.dart';

class FormStructure extends StatelessWidget {
  final List<Widget> widgets;
  final String buttonText;
  final VoidCallback onPressedButton;
  FormStructure({
    Key key,
    @required this.widgets,
    @required this.buttonText,
    @required this.onPressedButton
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.58,
        maxWidth: MediaQuery.of(context).size.width * 0.8,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 30.0,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5,
                maxWidth: MediaQuery.of(context).size.width * 0.8,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: widgets,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15.0,
            child: MaterialButton(
              child: Text(this.buttonText, style: TextStyle(color: Colors.white, fontSize: 25.0),),
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              color: GlobalColors.secundaryColor,
              onPressed: this.onPressedButton,
            ),
          )
        ],
      ),
    );
  }
}
