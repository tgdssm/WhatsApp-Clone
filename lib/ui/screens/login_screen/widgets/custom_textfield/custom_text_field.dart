import 'package:flutter/material.dart';
import 'package:whatsapp/utils/globals.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? iconPath;
  final TextEditingController? controller;
  final void Function(String value)? validator;

  CustomTextField({Key? key, this.labelText, this.iconPath, this.controller, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                ImageIcon(AssetImage(this.iconPath!), color: GlobalColors.secundaryColor,),
                SizedBox(width: 15,),
                Text(this.labelText!, style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
          TextFormField(
            controller: this.controller,
            validator: this.validator as String? Function(String?)?,
            decoration: InputDecoration(
            ),
          ),
        ],
      ),
    );
  }
}
