import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/data/models/chat.dart';
import 'package:whatsapp/data/repositories/chat_repository.dart';

class ChatController extends GetxController{
  final ChatRepository _chatRepository = ChatRepository();
  final _streamController = StreamController();

  final List<Chat> messages = [];
  late List<Chat> messagesRepository;
  bool loadingMessages = true;
  // Message text
  final message = TextEditingController();


  Future<void> sendMessage({required String receiverId}) async{
    Chat chat = Chat(message: this.message.text, receiverId: receiverId);
    await _chatRepository.sendMessage(chat: chat);
  }

  Future<void> readMessages({required String receiverId}) async {
    messages.clear();
    messagesRepository = await _chatRepository.readMessages(receiverId: receiverId);
    messages.addAll(messagesRepository);
    loadingMessages = false;
    update(['loading-messages']);
  }

  void listenMessages({required String receiverId}) {
    readMessages(receiverId: receiverId);
    _chatRepository.listenMessages(receiverId: receiverId).listen((event) {
      event.docChanges.forEach((element) {
        messages.add(Chat.fromJson(element.doc.data() as  Map<String, dynamic>));
      });
    });
    update(['loading-messages']);
  }
}