import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/data/models/user.dart';
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
        globalCurrentUser = await _userRepository.readCurrentUser(user.uid);
        final SharedPreferences _preferences = await SharedPreferences.getInstance();
        if(_preferences.get('auto_signin') == null){
          await _preferences.setString('auto_signin',
              jsonEncode({'email': emailController.text, 'password': passwordController.text}));
        }
      }
      await readAllUsers();
    }
  }

  Future<void> register() async{
    if(registerGlobalKey.currentState!.validate()){
      final createdUser = await _authRepository.createUserWithEmailAndPassword(emailController.text, passwordController.text);
      if(createdUser != null) {
        await _userRepository.createUser(
            User(
                userName: this.userNameController.text,
                email: createdUser.email!,
                uid: createdUser.uid,
            ));
        globalCurrentUser = await _userRepository.readCurrentUser(createdUser.uid);
      }
      await readAllUsers();
    }
  }


  Future<void> readAllUsers() async{
    List<User>? list = await _userRepository.readListOfUsersNotAdded();
    list != null?globalUsers.addAll(list):globalUsers = [];
  }

  void cleanValues(){
    this.emailController.clear();
    this.passwordController.clear();
    this.userNameController.clear();
  }

}