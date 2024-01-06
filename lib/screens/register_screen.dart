import 'package:chat/constants.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static String id = 'RegisterScreen';
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const Spacer(
              flex: 3,
            ),
            const Text(
              'Shcolar Chat',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
            const Row(
              children: [
                Text(
                  'Register',
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
            CustomTextFiled(
              hintlabel: 'Email',
              onChanged: (data) {
                email = data;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFiled(
              hintlabel: 'Password',
              onChanged: (data) {
                password = data;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtom(
              text: 'Register',
              onTap: () async {
                try {
                  await registerUser();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Success'),
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak password') {
                    showSnackBar(context, 'Weak Password');
                  } else if (e.code == 'email-already-in-use') {
                    showSnackBar(context, 'Email already exist');
                  }
                  print(e);
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'you already have account? ',
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Color.fromARGB(255, 54, 153, 148)),
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
