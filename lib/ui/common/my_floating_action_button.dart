import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/utils/globals.dart';

List<Positioned> myFloatingActionButton(
    { required VoidCallback onPressedFirsButton,
      required VoidCallback onPressedSecondButton,
      required IconData firstButtonIcon,
      required IconData secondButtonIcon
    }){
  return [
    Positioned(
      bottom: 80,
      right: 0,
      child: MaterialButton(
        child: Icon(firstButtonIcon, color: Colors.white,),
        padding: EdgeInsets.all(10),
        color: Colors.grey.withOpacity(.3),
        shape: CircleBorder(),
        onPressed: onPressedFirsButton,),
    ),
    Positioned(
      bottom: 15,
      right: 0,
      child: MaterialButton(
        child: Icon(secondButtonIcon, color: Colors.white,),
        padding: EdgeInsets.all(15),
        color: GlobalColors.secundaryColor,
        shape: CircleBorder(),
        onPressed: onPressedSecondButton,),
    )
  ];
}
