import 'package:chat/models/massage.dart';
import 'package:chat/screens/cubits/chat_cubit/chat_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(super.initialState);
  CollectionReference massages =
      FirebaseFirestore.instance.collection('massages');
      List<Massage> massagesList = [];
  void sendMassage({required String massage, required String email}) {
    massages.add({
      'massages': massage,
      'massageTime': DateTime.now(),
      'id': email,
    });
  }

  void getMassage() {
    massages.orderBy('massageTime', descending: true).snapshots().listen(
     
      (event) {
         massagesList.clear();
        for (var doc in event.docs) {
          massagesList.add(Massage.fromJson(doc));
        }
        print('fmblfmbl');
        emit(ChatSuccesss(massages: massagesList));
      },
    );
  }
}
