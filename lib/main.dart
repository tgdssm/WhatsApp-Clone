import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/ui/screens/chat_screen/chat_screen.dart';
import 'package:whatsapp/ui/screens/contacts_screen/contacts_screen.dart';
import 'package:whatsapp/ui/screens/home_screen/home_screen.dart';
import 'package:whatsapp/ui/screens/login_screen/login_screen.dart';
import 'package:whatsapp/ui/screens/view_status/view_status.dart';
import 'package:whatsapp/utils/app_routes.dart';
import 'package:whatsapp/utils/globals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: GlobalColors.primaryColor,
        accentColor: GlobalColors.secundaryColor,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        textTheme: TextTheme(

        ),
        buttonTheme: ButtonThemeData(
          buttonColor: GlobalColors.secundaryColor,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: GlobalColors.secundaryColor,
        )
      ),
      routes: {
        AppRoutes.INITIAL: (context) => LoginScreen(),
        AppRoutes.HOME_SCREEN: (context) => HomeScreen(),
        AppRoutes.CONTACTS_SCREEN: (context) => ContactsScreen(),
        AppRoutes.CHAT_SCREEN: (context) => ChatScreen(),
      },
    );
  }
}

