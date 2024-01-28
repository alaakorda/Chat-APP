import 'package:chat/helper/show_snack_bar.dart';
import 'package:chat/screens/chat_screen.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/register_screen.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/custom_circule_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({Key? key}) : super(key: key);
  static String id = 'OpeningScreen';

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  String? email, password;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const text = Text(
      'CHAT FRINDS',
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFB81736),
              Color(0xFF281537),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/CHAT_ICON-removebg-preview (1).png",
                width: 200,
                height: 200,
              ),

              const Center(child: text),
              const SizedBox(
                height: 127,
              ),
             
             
              SizedBox(
                height: 55,
                width: 310,
                child: OutlinedButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    LoginScreen.id,
                  ),
                  style: OutlinedButton.styleFrom(
                    
                      side: const BorderSide(
                    width: 1,
                    color: Colors.white,
                    style: BorderStyle.solid,
                  )),
                  child: const Center(
                      child: Text('SING IN',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  RegisterScreen.id,
                ),
                child: Container(
                  height: 55,
                  width: 315,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                      child: Text('SING UP',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF281537),
                          ))),
                ),
              ),
              const SizedBox(
                height: 95,
              ),
              const Text('Login With Social Media',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  )),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomCirculeButton(
                      image: "assets/images/instagram-logo.png"),
                  SizedBox(
                    width: 15,
                  ),
                  CustomCirculeButton(image: "assets/images/twitter.png"),
                  SizedBox(
                    width: 15,
                  ),
                  CustomCirculeButton(
                      image: "assets/images/facebook-logo (1).png"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginUser() {}
}
