import 'package:chat/constants.dart';
import 'package:chat/helper/show_snack_bar.dart';
import 'package:chat/screens/chat_screen.dart';
import 'package:chat/screens/cubits/register_cubit/register_cubit.dart';
import 'package:chat/screens/cubits/register_cubit/register_state.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatelessWidget {
  static String id = 'RegisterScreen';
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if(state is RegisterSuccess){
          Navigator.pushNamed(context, ChatScreen.id,arguments: email);
        }
        else if(state is RegisterFaild){
          showSnackBar(context, state.errorMassage!);
        }
        else if(state is RegisterLoading){
          isloading = true;
        }
        else if(state is RegisterInitial){
          isloading = false;
        }
        else{
          isloading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloading,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
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
                  child: const Padding(
                    padding: EdgeInsets.only(top: 60.0, left: 22),
                    child: Text(
                      'Create Your \nAccount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 210.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    height: double.infinity,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 27.0, right: 27.0, top: 40),
                      child: Form(
                        key: formkey,
                        child: ListView(
                          children: [
                            CustomTextFormFiled(
                                hintlabel: 'Email',
                                onChanged: (data) {
                                  email = data;
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormFiled(
                              hintlabel: 'Password',
                              obscureText: true,
                              onChanged: (data) {
                                password = data;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormFiled(
                              hintlabel: 'Confirm Password',
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            CustomButtom(
                              text: 'SING UP',
                              onTap: () async {
                                if (formkey.currentState!.validate()) {
                                  BlocProvider.of<RegisterCubit>(context)
                                      .registerUser(
                                          email: email!, password: password!);
                                }
                              },
                            ),
                            const SizedBox(
                              height: 120,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    'Do you have an account? ',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: const Text(
                                      'sign in ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  
}
