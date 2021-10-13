class User {
  late String userName;
  late String email;
  late String uid;
  late String message;
  String? photo;

  User({required this.userName, required this.email, required this.uid,});

  User.fromJson(Map<String, dynamic> snapshot) {
    this.userName = snapshot['userName'];
    this.email = snapshot['email'];
    this.uid = snapshot['uid'];
    this.message = 'Seja bem vindo!';
  }

  Map<String, dynamic> toJson() {
    return {'userName': this.userName, 'email': this.email, 'uid': this.uid};
  }
}
