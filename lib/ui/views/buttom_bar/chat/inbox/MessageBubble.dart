// ignore_for_file: file_names
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final String message;

  const MessageBubble({super.key, required this.isMe, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe ? const Color(0xff4873a6).withOpacity(0.7): Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
              bottomLeft: isMe
                  ? const Radius.circular(10.0)
                  : const Radius.circular(0.0),
              bottomRight: isMe
                  ? const Radius.circular(0.0)
                  : const Radius.circular(10.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
          child: Container(
            constraints: const BoxConstraints(minWidth: 10, maxWidth: 200),
            child: Text(
              message,
              style: TextStyle(
                height: 1.5,
                color: isMe ? Colors.white : Colors.black,
              ),
              softWrap: true,
            ),
          ),
        ),
      ],
    );
  }
}
