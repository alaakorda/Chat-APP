import 'package:chat/constants.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
       
        padding:  EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        
        margin: const EdgeInsets.only(left:16, right: 16, bottom: 8,top: 8),
        decoration: const BoxDecoration(
            color: KPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            )),
        child: const Text(
          'I am alaa can i hlep you ?',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
