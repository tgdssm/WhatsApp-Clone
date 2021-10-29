import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/data/models/chat.dart';
import 'package:whatsapp/ui/screens/chat_screen/chat_controller.dart';
import 'package:whatsapp/ui/screens/chat_screen/chat_screen_arguments.dart';
import 'package:whatsapp/utils/globals.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = Get.put(ChatController());
  final _scrollTextField = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ChatScreenArguments;
    _controller.readMessages(receiverId: arguments.contactInformation.uid);
    // _controller.listenMessages(receiverId: arguments.contactInformation.uid);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors.primaryColorWithOpacity,
        leadingWidth: 25,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: GlobalColors.textColor),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.videocam_rounded, color: GlobalColors.textColor),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.call, color: GlobalColors.textColor),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                CupertinoIcons.ellipsis_vertical,
                color: GlobalColors.textColor,
              ),
              onPressed: () async {
                final value = await showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(1, 0, 0, 0),
                    items: [
                      PopupMenuItem(
                          child: Text(
                        'Ver contato',
                        style: TextStyle(color: GlobalColors.textColor),
                      )),
                      PopupMenuItem(
                          child: Text(
                        'Mídia, links e docs',
                        style: TextStyle(color: GlobalColors.textColor),
                      )),
                      PopupMenuItem(
                          child: Text(
                        'Silenciar notificações',
                        style: TextStyle(color: GlobalColors.textColor),
                      )),
                      PopupMenuItem(
                          child: Text(
                        'Papel de parede',
                        style: TextStyle(color: GlobalColors.textColor),
                      )),
                      PopupMenuItem(
                          child: Row(
                        children: [
                          Text(
                            'Mais',
                            style: TextStyle(color: GlobalColors.textColor),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_right, color: GlobalColors.textColor)
                        ],
                      )),
                    ],
                    color: Color(0xff313C42));
                print(value);
              }),
        ],
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://www.vounajanela.com/wp-content/uploads/2019/12/toquio-1.jpg'),
                    fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                arguments.contactInformation.userName,
                style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/chat_screen_images/chat_screen_background.png'),
            fit: BoxFit.cover
          )
        ),
        child: GetBuilder<ChatController>(
          init: _controller,
          id: 'loading-messages',
          builder: (controller) {
            if(_controller.loadingMessages){
              return CircularProgressIndicator();
            }
            return Column(
              children: [
                Expanded(child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  itemCount: _controller.messages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      alignment: _controller.messages[index].senderId == globalCurrentUser!.uid?Alignment.centerRight:Alignment.centerLeft,
                      child: Container(
                          width:150,
                          child: Text('${_controller.messages[index].message}', style: TextStyle(color: GlobalColors.textColor, fontSize: 15),)),
                    );
                  },
                )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  alignment: Alignment.center,
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                              color: GlobalColors.primaryColor,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.emoji_emotions_rounded, color: GlobalColors.textColor,),
                              SizedBox(width: 8,),
                              Expanded(child: TextField(
                                controller: _controller.message,
                                keyboardType: TextInputType.multiline,
                                maxLines: 10,
                                onChanged: (value) => _controller.update(['icon-send-message']),
                                style: TextStyle(
                                    color: GlobalColors.textColor,
                                    fontSize: 21
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Mensagem',
                                  hintStyle: TextStyle(
                                    color: GlobalColors.textColor.withOpacity(.8),
                                    fontSize: 21,
                                  ),
                                ),
                              )),
                              SizedBox(width: 8,),
                              Icon(Icons.attach_file, color: GlobalColors.textColor,),
                              Icon(Icons.camera_alt, color: GlobalColors.textColor,),
                            ],
                          ),
                        ),
                      ),
                      GetBuilder<ChatController>(
                          init: _controller,
                          id: 'icon-send-message',
                          builder: (controller) {
                            if(_controller.message.text.length >= 1 && _controller.message.text.removeAllWhitespace.length > 0){
                              return MaterialButton(
                                onPressed: () async{
                                  await _controller.sendMessage(receiverId: arguments.contactInformation.uid);
                                },
                                color: GlobalColors.secundaryColor,
                                child: Center(child: Icon(Icons.send, color: GlobalColors.textColor,)),
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(15),
                              );
                            } else {
                              return MaterialButton(
                                onPressed: (){},
                                color: GlobalColors.secundaryColor,
                                child: Center(child: Icon(Icons.mic, color: GlobalColors.textColor,)),
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(15),
                              );
                            }
                          }
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    ));
  }
}
