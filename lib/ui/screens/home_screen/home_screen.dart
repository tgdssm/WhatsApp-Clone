import 'package:flutter/material.dart';
import 'package:whatsapp/ui/screens/home_screen/home_screen_arguments.dart';
import 'package:whatsapp/utils/globals.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as HomeScreenArguments;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Text(globalUserModel.userName),
                MaterialButton(
                  child: Text(arguments.acao),
                  color: Colors.green,
                  onPressed: (){

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
