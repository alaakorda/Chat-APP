import 'package:chat/constants.dart';
import 'package:chat/models/massage.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
    required this.massage,
  });
  final Massage massage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0, 3),
              )
            ]),
        child: Text(
          massage.message,
          style: const TextStyle(color:  Color(0xFF281537),),
        ),
      ),
    );
  }
}

class ChatBubleForFrinds extends StatelessWidget {
  const ChatBubleForFrinds({
    super.key,
    required this.massage,
  });
  final Massage massage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
        decoration: const BoxDecoration(
            color:  Color(0xFFB81736),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0, 3),
              )
            ]
            ),
        child: Text(
          massage.message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
