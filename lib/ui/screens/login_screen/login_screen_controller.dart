import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/data/models/user_model.dart';
import 'package:whatsapp/data/repositories/auth_repository.dart';
import 'package:whatsapp/data/repositories/user_repository.dart';
import 'package:whatsapp/utils/globals.dart';

class LoginScreenController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  final UserRepository _userRepository = UserRepository();

  TabController tabController;
  int currentTab = 0;

  final loginGlobalKey = GlobalKey<FormState>();
  final registerGlobalKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  Future<void> login() async{
    if(loginGlobalKey.currentState.validate()){
      final user = await _authRepository.signInWithEmailAndPassword(emailController.text, passwordController.text);
      globalUserModel = await _userRepository.readUser(user.uid);
    }
  }

  Future<void> register() async{
    if(registerGlobalKey.currentState.validate()){
      final createdUser = await _authRepository.createUserWithEmailAndPassword(emailController.text, passwordController.text);
      await _userRepository.createUser(
          UserModel(
              userName: this.userNameController.text,
              email: createdUser.email,
              uid: createdUser.uid
          ));
      globalUserModel = await _userRepository.readUser(createdUser.uid);
    }
  }

  void cleanValues(){
    this.emailController.clear();
    this.passwordController.clear();
    this.userNameController.clear();
  }

}