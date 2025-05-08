/// chat_page.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../controller/chat_controller.dart';
import '../services/chat_service.dart';
import '../services/device_service.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final ChatController _ctrl;
  final TextEditingController _input = TextEditingController();
  String? _deviceId;

  @override
  void initState() {
    super.initState();
    _ctrl = Get.put(ChatController(ChatService(Dio())));
    DeviceService.getDeviceId().then((id) => setState(() => _deviceId = id));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor:Color(0xFF0E1657),
      foregroundColor: Colors.white,
      title: Text('Traffic Offences Help Center'),
      centerTitle: true,
    ),
    body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0E1657),
              Color(0xFF2E3061),
            ],
          ),
      ),
      child: Column(
          children: [
        Expanded(child: Obx(() {
          // Build list of messages and optional loading bubble
          final count = _ctrl.messages.length + (_ctrl.isLoading.value ? 1 : 0);
          return ListView.builder(
            reverse: true,
            padding: EdgeInsets.all(16),
            itemCount: count,
            itemBuilder: (_, i) {
              // Newest at bottom
              final index = (_ctrl.isLoading.value)
                  ? _ctrl.messages.length - i
                  : _ctrl.messages.length - 1 - i;
              // Loading bubble first when loading
              if (_ctrl.isLoading.value && i == 0) {
                return LoadingBubble();
              }
              final msg = _ctrl.messages[index];
              return MessageBubble(msg: msg);
            },
          );
        })),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: _buildInputArea(),
        )
      ]),
    ),
  );

  Widget _buildInputArea() => SafeArea(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A0E21),
              Color(0xFF1D1E33),
            ],
          ),
          boxShadow: [
        BoxShadow(
            color: Colors.black12, blurRadius: 4, offset: Offset(0, -2))
      ]),
      child: Row(children: [
        Expanded(
            child: TextField(
              style: TextStyle(
                color: Colors.white
              ),
              controller: _input,
              decoration: InputDecoration.collapsed(

                  hintText: 'Type a message',
                hintStyle: TextStyle(color: Colors.white)
              ),
            )),
        IconButton(
            icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
            onPressed: _deviceId == null
                ? null
                : () {
              _ctrl.send(_deviceId!, _input.text);
              _input.clear();
            })
      ]),
    ),
  );
}

class MessageBubble extends StatelessWidget {
  final ChatMessage msg;
  MessageBubble({required this.msg});

  @override
  Widget build(BuildContext context) {
    final align = msg.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final color1 = msg.isUser ? Colors.blueAccent : Colors.grey.shade300;
    final color2 = msg.isUser ? Colors.lightBlueAccent : Colors.white;
    final radius = BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
      bottomLeft: msg.isUser ? Radius.circular(16) : Radius.circular(0),
      bottomRight: msg.isUser ? Radius.circular(0) : Radius.circular(16),
    );
    return Column(
      crossAxisAlignment: align,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [color1, color2], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: radius,
          ),
          child: Text(msg.text, style: TextStyle(fontSize: 16)),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: msg.isUser ? 0 : 12,
            right: msg.isUser ? 12 : 0,
            bottom: 6,
          ),
          child: Text(
            DateFormat('hh:mm a').format(msg.timestamp),
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        )
      ],
    );
  }
}

class LoadingBubble extends StatelessWidget {
  const LoadingBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: SpinKitThreeBounce(
            color: Colors.blue,
            size: 18,
          ),
        ),
      ],
    );
  }
}