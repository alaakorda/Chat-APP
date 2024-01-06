import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({Key? key, this.onTap, required this.text}) : super(key: key);
  final String? text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
            child: Text(text!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B5E20),
                ))),
      ),
    );
  }
}
