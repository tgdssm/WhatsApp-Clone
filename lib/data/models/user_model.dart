class UserModel {
  late String userName;
  late String email;
  late String uid;
  String? photo;

  UserModel({required this.userName, required this.email, required this.uid});

  UserModel.fromJson(Map<String, dynamic> snapshot) {
    this.userName = snapshot['userName'];
    this.email = snapshot['email'];
    this.uid = snapshot['uid'];
  }

  Map<String, dynamic> toJson() {
    return {'userName': this.userName, 'email': this.email, 'uid': this.uid};
  }
}
