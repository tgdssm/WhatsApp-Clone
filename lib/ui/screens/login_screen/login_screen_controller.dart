import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/data/models/user_model.dart';
import 'package:whatsapp/data/repositories/auth_repository.dart';
import 'package:whatsapp/data/repositories/user_repository.dart';
import 'package:whatsapp/utils/globals.dart';

class LoginScreenController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  final UserRepository _userRepository = UserRepository();

  late TabController tabController;

  final loginGlobalKey = GlobalKey<FormState>();
  final registerGlobalKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  Future<void> login() async{
    if(loginGlobalKey.currentState!.validate()){
      final user = await (_authRepository.signInWithEmailAndPassword(emailController.text, passwordController.text));
      if(user != null) {
        globalUserModel = await _userRepository.readUser(user.uid);
        final SharedPreferences _preferences = await SharedPreferences.getInstance();
        if(_preferences.get('auto_signin') == null){
          await _preferences.setString('auto_signin',
              jsonEncode({'email': emailController.text, 'password': passwordController.text}));
        }
      }
    }
  }

  Future<void> register() async{
    if(registerGlobalKey.currentState!.validate()){
      final createdUser = await _authRepository.createUserWithEmailAndPassword(emailController.text, passwordController.text);
      if(createdUser != null) {
        await _userRepository.createUser(
            UserModel(
                userName: this.userNameController.text,
                email: createdUser.email!,
                uid: createdUser.uid,
            ));
        globalUserModel = await _userRepository.readUser(createdUser.uid);
      }
    }
  }

  void cleanValues(){
    this.emailController.clear();
    this.passwordController.clear();
    this.userNameController.clear();
  }

}