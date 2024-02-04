import 'package:chat/firebase_options.dart';
import 'package:chat/screens/chat_screen.dart';
import 'package:chat/screens/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat/screens/cubits/chat_cubit/chat_state.dart';
import 'package:chat/screens/cubits/login_cubit/login_cubit.dart';
import 'package:chat/screens/cubits/register_cubit/register_cubit.dart';
import 'package:chat/screens/cubits/register_cubit/register_state.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/opening_screen.dart';
import 'package:chat/screens/register_screen.dart';
import 'package:chat/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 

  Bloc.observer = SimpleBlocObserver();
 runApp( MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit( RegisterInitial()), 
        ),
        BlocProvider(create:  (context) => ChatCubit(ChatInitial()),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'OpeningScreen',
        routes: {
          OpeningScreen.id: (context) => const OpeningScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          ChatScreen.id: (context) => ChatScreen(),
        },
      ),
    );
  }
}
