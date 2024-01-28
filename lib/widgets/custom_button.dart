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

        
        height: 55,
          width: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              const Color(0xFFB81736),
              const Color(0xFF281537),
            ],
          ),
         
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(text!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color:Colors.white,
                ))),
      ),
    );
  }
}
