import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userName;
  String email;
  String photo;
  String uid;

  UserModel({this.userName, this.email, this.uid});

  UserModel.fromJson(Map<String, dynamic> snapshot) {
    this.userName = snapshot['userName'];
    this.email = snapshot['email'];
    this.uid = snapshot['uid'];
  }


  Map<String, dynamic> toJson(){
    return {
      'userName': this.userName,
      'email': this.email,
      'uid': this.uid
    };
  }
}