import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({Key? key,this.onTap, required this.text}) : super(key: key);
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
        child: TextButton(
          onPressed: (){},
          child: Text(
            text!,
            style:
                TextStyle(color: Color.fromARGB(255, 54, 153, 148), fontSize: 17),
          ),
        ),
      ),
    );
  }
}
