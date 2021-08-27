import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/ui/screens/home_screen/home_screen_arguments.dart';
import 'package:whatsapp/ui/screens/login_screen/login_screen_controller.dart';
import 'package:whatsapp/ui/screens/login_screen/widgets/custom_textfield/custom_text_field.dart';
import 'package:whatsapp/ui/screens/login_screen/widgets/form_structure/form_structure.dart';
import 'package:whatsapp/utils/app_routes.dart';
import 'package:whatsapp/utils/globals.dart';

class LoginForm extends StatelessWidget {
  final _controller = Get.find<LoginScreenController>();

  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _controller.loginGlobalKey,
        child: FormStructure(
            widgets: [
              CustomTextField(
                controller: _controller.emailController,
                labelText: 'Email',
                iconPath: 'assets/icons/login_screen_icons/email_icon.png',
              ),
              SizedBox(height: 20,),
              CustomTextField(
                controller: _controller.passwordController,
                labelText: 'Senha',
                iconPath: 'assets/icons/login_screen_icons/password_icon.png',
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: (){},
                    child: Text('Esqueceu sua senha?',
                      style: TextStyle(color: GlobalColors.secundaryColor, fontSize: 18),)
                ),
              )
            ],
            buttonText: 'LOGIN',
            onPressedButton: () async {
              await _controller.login();
              Navigator.pushReplacementNamed(context, AppRoutes.HOME_SCREEN, arguments: HomeScreenArguments(acao: 'login'));
        }),
      ),
    );
  }
}
