import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
   CustomTextFiled({Key? key,this.onChanged, required this.hintlabel}) : super(key: key);
  final String? hintlabel;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: hintlabel,
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}