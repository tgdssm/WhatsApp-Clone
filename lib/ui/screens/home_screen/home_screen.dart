import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/ui/screens/home_screen/home_screen_arguments.dart';
import 'package:whatsapp/ui/screens/home_screen/widgets/status_list/status_list.dart';
import 'package:whatsapp/utils/globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as HomeScreenArguments;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: CustomScrollView(

            slivers: [
              SliverAppBar(
                backgroundColor: GlobalColors.primaryColorWithOpacity,
                title: Text('WhatsApp', style: TextStyle(color: GlobalColors.textColor, fontWeight: FontWeight.bold),),
                actions: [
                  IconButton(icon: Icon(CupertinoIcons.search, color: GlobalColors.textColor,), onPressed: (){}),
                  IconButton(icon: Icon(CupertinoIcons.ellipsis_vertical, color: GlobalColors.textColor,), onPressed: (){}),
                ],
                floating: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                      color: GlobalColors.primaryColor
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Text('STATUS', style: TextStyle(color: GlobalColors.textColor, fontWeight: FontWeight.bold, fontSize: 18)),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(15, 30, 15, 15),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(height: 1, color: GlobalColors.textColor.withOpacity(.5), thickness: 1,),
                        ),
                        Expanded(child: StatusList()),
                      ],
                    ),
                  ),
                  Container(
                    height: 65,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: GlobalColors.primaryColorWithOpacity
                    ),
                    child: TabBar(
                      indicatorWeight: 3,
                      controller: _tabController,
                      tabs: [
                        Tab(child: Text('CHATS', style: TextStyle(color: GlobalColors.textColor, fontWeight: FontWeight.bold, fontSize: 18)),),
                        Tab(child: Text('CALLS', style: TextStyle(color: GlobalColors.textColor, fontWeight: FontWeight.bold, fontSize: 18)),),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: GlobalColors.primaryColor
                    ),
                    height: 600,
                    child: ListView.builder(
                      itemCount: 50,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('testando', style: TextStyle(color: GlobalColors.textColor),),
                          subtitle: Text('sliver', style: TextStyle(color: GlobalColors.secundaryColor)),
                        );
                      },
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
