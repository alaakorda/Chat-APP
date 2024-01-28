import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled({Key? key, this.onChanged, this.obscureText = false,  this.hintlabel, })
      : super(key: key);
  final String? hintlabel;
   bool? obscureText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:18.0,right: 18.0,top: 8.0,bottom: 8.0),
      child: TextFormField(

        obscureText: obscureText!,
        validator: (value) => value!.isEmpty ? 'Please Enter Your Email' : null,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintlabel,
          hintStyle: const TextStyle(color:  Color(0xFFB81736)),
        ),
      ),
    );
  }
}
