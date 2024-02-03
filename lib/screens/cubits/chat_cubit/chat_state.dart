import 'package:chat/models/massage.dart';

abstract class ChatState {}
class ChatInitial extends ChatState {}
class ChatSuccesss extends ChatState{
 List<Massage> massages;
  ChatSuccesss({required this.massages});
} 