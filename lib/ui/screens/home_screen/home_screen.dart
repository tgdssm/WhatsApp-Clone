import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/ui/screens/conversation_screen/conversation_screen.dart';
import 'package:whatsapp/ui/screens/home_screen/home_screen_arguments.dart';
import 'package:whatsapp/ui/screens/status_screen/status_screen.dart';
import 'package:whatsapp/utils/globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as HomeScreenArguments?;
    return Scaffold(
      backgroundColor: GlobalColors.primaryColor,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: GlobalColors.primaryColorWithOpacity,
              title: Text('WhatsApp', style: TextStyle(color: GlobalColors.textColor, fontWeight: FontWeight.bold),),
              actions: [
                IconButton(icon: Icon(CupertinoIcons.search, color: GlobalColors.textColor,), onPressed: (){}),
                IconButton(icon: Icon(CupertinoIcons.ellipsis_vertical, color: GlobalColors.textColor,), onPressed: (){
                  showMenu(
                    context: context, position: RelativeRect.fromLTRB(1, 0, 0, 0),
                    items: [
                      PopupMenuItem(child: Text('Novo grupo', style: TextStyle(color: GlobalColors.textColor),)),
                      PopupMenuItem(child: Text('Nova transmissão', style: TextStyle(color: GlobalColors.textColor),)),
                      PopupMenuItem(child: Text('Aparelhos conectados', style: TextStyle(color: GlobalColors.textColor),)),
                      PopupMenuItem(child: Text('Mensagens favoritas', style: TextStyle(color: GlobalColors.textColor),)),
                      PopupMenuItem(child: Text('Pagamentos', style: TextStyle(color: GlobalColors.textColor),)),
                      PopupMenuItem(child: Text('Configurações', style: TextStyle(color: GlobalColors.textColor),)),
                    ],
                    color: Color(0xff313C42)
                  );
                }),
              ],
              floating: true,
              pinned: true,
              snap: true,
              bottom: TabBar(
                indicatorWeight: 3,
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                isScrollable: true,
                tabs: [
                  Tab(icon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(CupertinoIcons.camera_fill),
                  ),),
                  Tab(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text('CONVERSAS', style: TextStyle(color: GlobalColors.textColor, fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(width: 5,),
                        Icon(CupertinoIcons.circle_fill, color: GlobalColors.secundaryColor,)
                      ],
                    ),
                  ),),
                  Tab(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text('STATUS', style: TextStyle(color: GlobalColors.textColor, fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(width: 5,),
                        Icon(CupertinoIcons.circle_fill, color: GlobalColors.textColor, size: 10,)
                      ],
                    ),
                  ),),
                  Tab(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text('CHAMADAS', style: TextStyle(color: GlobalColors.textColor, fontWeight: FontWeight.bold, fontSize: 16)),
                  ),),
                ],
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: [
              Container(),
              ConversationScreen(),
              StatusScreen(),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
