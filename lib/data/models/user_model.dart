import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userName;
  String email;
  String photo;
  String uid;

  UserModel({this.userName, this.email, this.uid});

  UserModel.fromJson(QueryDocumentSnapshot snapshot) {
    this.userName = snapshot.data()['userName'];
    this.email = snapshot.data()['email'];
    this.uid = snapshot.data()['uid'];
  }


  Map<String, dynamic> toJson(){
    return {
      'userName': this.userName,
      'email': this.email,
      'uid': this.uid
    };
  }
}