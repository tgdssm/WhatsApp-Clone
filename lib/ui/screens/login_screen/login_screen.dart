import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/ui/screens/login_screen/login_screen_controller.dart';
import 'package:whatsapp/ui/screens/login_screen/widgets/login_form/login_form.dart';
import 'package:whatsapp/ui/screens/login_screen/widgets/register_form/register_form.dart';
import 'package:whatsapp/utils/app_routes.dart';
import 'package:whatsapp/utils/globals.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{
  final _loginScreenController = Get.put(LoginScreenController());
  @override
  void initState() {
    _loginScreenController.tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 60,),
            TabBar(
              controller: _loginScreenController.tabController,
              onTap: (tab){
                if(_loginScreenController.currentTab != tab){
                  _loginScreenController.cleanValues();
                }
                _loginScreenController.currentTab = tab;
              },
              tabs: [
                Tab(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageIcon(AssetImage('assets/icons/login_screen_icons/login_icon.png')),
                    SizedBox(width: 10,),
                    Text('LOGIN', style: TextStyle(fontSize: 20),),
                  ],
                ),),
                Tab(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageIcon(AssetImage('assets/icons/login_screen_icons/register_icon.png')),
                    SizedBox(width: 10,),
                    Text('REGISTRAR', style: TextStyle(fontSize: 20),),
                  ],
                ),),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _loginScreenController.tabController,
                children: [
                  LoginForm(),
                  RegisterForm()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
