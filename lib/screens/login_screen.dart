import 'package:chat/constants.dart';
import 'package:chat/screens/register_screen.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 75 * 3,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Shcolar Chat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFiled(hintlabel: 'Email',
            //  onChanged: (data) {
            //   email = data;
            // }
            ),
            const SizedBox(
              height: 10,
            ),
             CustomTextFiled(hintlabel: 'Password',
            //  onChanged: (data){
            //     password = data;
            //  }
             ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: GestureDetector(
                  onTap: () {}, child:  CustomButtom(text: 'LOGIN')),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'don\'t have an account? ',
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, RegisterScreen.id),
                  child: const Text(
                    'sign up',
                    style: TextStyle(color: Color.fromARGB(255, 54, 153, 148)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
