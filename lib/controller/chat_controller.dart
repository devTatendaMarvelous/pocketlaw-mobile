import 'package:get/get.dart';

import '../services/chat_service.dart';


class ChatController extends GetxController {
  final ChatService service;
  ChatController(this.service);

  var messages = <ChatMessage>[].obs;
  var isLoading = false.obs;

  void send(String deviceId, String text) async {
    if (text.trim().isEmpty) return;
    messages.add(ChatMessage(text: text, isUser: true));
    isLoading.value = true;
    try {
      final reply = await service.sendMessage(deviceId: deviceId, message: text);
      messages.add(ChatMessage(text: reply, isUser: false));
    } catch (e) {
      messages.add(ChatMessage(text: 'Error: \$e', isUser: false));
    } finally {
      isLoading.value = false;
    }
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({required this.text, required this.isUser, DateTime? timestamp})
      : timestamp = timestamp ?? DateTime.now();
}