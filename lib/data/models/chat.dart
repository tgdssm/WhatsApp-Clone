import 'package:whatsapp/utils/globals.dart';

class Chat {
  late String message;
  late String senderId;
  late String receiverId;
  late DateTime date;

  Chat({required this.message, required this.receiverId});

  Chat.fromJson(Map<String, dynamic> json){
    this.message = json['message'];
    this.senderId = json['senderId'];
    this.receiverId = json['receiverId'];
    this.date = json['date'].toDate();
  }

  Map<String, dynamic> toJson() {
    return {
      'message': this.message,
      'receiverId': this.receiverId,
      'senderId': globalCurrentUser!.uid,
      'date': DateTime.now()
    };
  }

}