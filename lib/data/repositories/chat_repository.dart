import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp/data/models/chat.dart';
import 'package:whatsapp/data/providers/chat_provider.dart';

class ChatRepository {
  final ChatProvider _chatProvider = ChatProvider();

  Future<void> sendMessage({required Chat chat}) async{
    await _chatProvider.sendMessage(chat);
  }

  Future<List<Chat>> readMessages({required String receiverId}) async{
    return await _chatProvider.readMessages(receiverId);
  }

  Stream<QuerySnapshot> listenMessages({required String receiverId}) {
    return _chatProvider.listenMessages(receiverId);
  }
}