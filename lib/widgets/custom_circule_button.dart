import 'package:flutter/material.dart';

class CustomCirculeButton extends StatelessWidget {
  const CustomCirculeButton({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
       width: 45,
       height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(
                image,
              ),
              size: 30,
              color:Color(0xFF821D3B) ,
            ),
          ],
        ),
      ),
    );
  }
}
