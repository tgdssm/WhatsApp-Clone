import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp/data/models/chat.dart';
import 'package:whatsapp/utils/globals.dart';

class ChatProvider {
  CollectionReference _collectionReference = FirebaseFirestore.instance.collection('Conversations');

  Future<void> sendMessage(Chat chat) async {
    try{
      await _collectionReference.add(chat.toJson());
    } on FirebaseException catch(e){
      print(e.message);
    }
  }

  Future<List<Chat>> readMessages(String receiverId) async{
    List<Chat> messages = [];
    final mySnapshot = await _collectionReference
        .where('senderId', isEqualTo: globalCurrentUser!.uid)
        .where('receiverId', isEqualTo: receiverId).get();
    await Future.forEach(mySnapshot.docs, (QueryDocumentSnapshot element){
      messages.add(Chat.fromJson(element.data() as Map<String, dynamic>));
    });
    final receiverSnapshots = await _collectionReference
        .where('senderId', isEqualTo: receiverId)
        .where('receiverId', isEqualTo: globalCurrentUser!.uid).get();
    await Future.forEach(receiverSnapshots.docs, (QueryDocumentSnapshot element){
      messages.add(Chat.fromJson(element.data() as Map<String, dynamic>));
    });
    messages.sort((a, b) => a.date.isAfter(b.date)? 1:-1);
    return messages;
  }

  Stream<QuerySnapshot> listenMessages(String receiverId) {
    return _collectionReference
        .where('senderId', isEqualTo: globalCurrentUser!.uid)
        .where('receiverId', isEqualTo: receiverId).snapshots();
  }


}