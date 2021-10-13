import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/ui/screens/chat_screen/chat_screen_arguments.dart';
import 'package:whatsapp/ui/screens/contacts_screen/contact_controller.dart';
import 'package:whatsapp/utils/app_routes.dart';
import 'package:whatsapp/utils/globals.dart';

class ContactsScreen extends StatelessWidget {
  ContactsScreen({Key? key}) : super(key: key);

  final _controller = Get.find<ContactsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.primaryColor,
      appBar: AppBar(
        backgroundColor: GlobalColors.primaryColorWithOpacity,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back, color: GlobalColors.textColor),),
        title: Text('Contatos', style: TextStyle(color: GlobalColors.textColor),),
        actions: [
          IconButton(icon: Icon(CupertinoIcons.search, color: GlobalColors.textColor,), onPressed: (){}),
          IconButton(icon: Icon(CupertinoIcons.ellipsis_vertical, color: GlobalColors.textColor,), onPressed: () async {
            final value = await showMenu(
                context: context, position: RelativeRect.fromLTRB(1, 0, 0, 0),
                items: [
                  PopupMenuItem(child: Text('Adicionar contato', style: TextStyle(color: GlobalColors.textColor),)),
                  PopupMenuItem(child: Text('Contatos', style: TextStyle(color: GlobalColors.textColor),)),
                  PopupMenuItem(child: Text('Atualizar', style: TextStyle(color: GlobalColors.textColor),)),
                  PopupMenuItem(child: Text('Ajuda', style: TextStyle(color: GlobalColors.textColor),)),
                ],
                color: Color(0xff313C42)
            );
            print(value);
          }),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 15),
        itemCount: _controller.listOfUsersNotAdded.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.CHAT_SCREEN, arguments: ChatScreenArguments(contactInformation:  _controller.listOfUsersNotAdded[index]));
            },
            title: Text('${_controller.listOfUsersNotAdded[index].userName}', style: TextStyle(color: GlobalColors.textColor, fontSize: 20, fontWeight: FontWeight.bold),),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text('${_controller.listOfUsersNotAdded[index].message}', style: TextStyle(color: GlobalColors.textColor.withOpacity(.8), fontSize: 16)),
            ),
            leading: GestureDetector(
              onTap: (){print('tocando foto');},
              child: Container(
                height: 40,
                width: 40,
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
    );
  }
}
