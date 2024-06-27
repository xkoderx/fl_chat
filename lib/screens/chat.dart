import 'dart:io';

import 'package:chat/themes/themes.dart';
import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  final List<ChatMessage> _messages = [];
  bool _isWritting = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.brown[400],
              maxRadius: 14,
              child: Text(
                'Chat',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (_, i) => _messages[i],
              physics: BouncingScrollPhysics(),
              reverse: true,
            ),
          ),
          Divider(
            height: 6,
          ),
          _inputChat()
        ],
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 12),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                // style: TextStyle(color: Colors.white),
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (texto) {
                  setState(() {
                    if (texto.trim().isNotEmpty) _isWritting = true;
                  });
                },
                cursorColor: theme.appBarTheme.backgroundColor,
                showCursor: true,
                decoration: InputDecoration(
                  hintText: 'Enviar mensaje',
                  fillColor: theme.primaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                focusNode: _focusNode,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              child: Platform.isIOS
                  ? CupertinoButton(child: Text('Enviar'), onPressed: () {})
                  : IconButton(
                      onPressed: () => () {
                        _isWritting
                            ? (_) => _handleSubmit(
                                  _textController.text.trim(),
                                )
                            : null;
                      },
                      icon: Icon(Icons.send),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSubmit(String texto) {
    if (texto.length == 0) return _focusNode.requestFocus();
    print(texto);
    _focusNode.requestFocus();
    _textController.clear();

    final newMessage = ChatMessage(
      texto: texto,
      uid: '123',
      animationController: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
      ),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      _isWritting = false;
    });
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
