import 'package:flutter/material.dart';
import 'package:whatsapp/utils/globals.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 15),
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: (){print('tocando');},
              title: Text('Thalisson', style: TextStyle(color: GlobalColors.textColor, fontSize: 20, fontWeight: FontWeight.bold),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text('Você bloqueou esse contato', style: TextStyle(color: GlobalColors.textColor.withOpacity(.8), fontSize: 16)),
              ),
              leading: GestureDetector(
                onTap: (){print('tocando foto');},
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage('https://www.vounajanela.com/wp-content/uploads/2019/12/toquio-1.jpg'),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              // contentPadding: EdgeInsets.symmetric(vertical: 10),
            );
          },
        ),
        Positioned(
          bottom: 15,
          right: 0,
          child: MaterialButton(
            child: Icon(Icons.message_sharp, color: Colors.white,),
            padding: EdgeInsets.all(15),
            color: GlobalColors.secundaryColor,
            shape: CircleBorder(),
            onPressed: (){},),
        )
      ]
    );
  }
}
