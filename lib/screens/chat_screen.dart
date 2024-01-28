import 'package:chat/constants.dart';
import 'package:chat/models/massage.dart';
import 'package:chat/widgets/chat_buble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  static String id = 'ChatScreen';
  CollectionReference massages =
      FirebaseFirestore.instance.collection('massages');
  TextEditingController massageController = TextEditingController();
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: massages.orderBy('massageTime', descending: true).snapshots(),
      builder: (context, snapshot) {
        // print(snapshot.data!.docs[0]['massages']);
        if (snapshot.hasData) {
          List<Massage> massagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            massagesList.add(Massage.formJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text(
                  'Chat Friends',
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Color(0xFFB81736),
                          Color(0xFF281537),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ]),
                )),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: massagesList.length,
                    itemBuilder: (context, index) {
                      return massagesList[index].id == email
                          ? ChatBuble(
                              massage: massagesList[index],
                            )
                          : ChatBubleForFrinds(
                              massage: massagesList[index],
                            );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: TextField(
                        controller: massageController,
                        onSubmitted: (data) {
                          print('Submitted: $data');
                          massages.add({
                            'massages': data,
                            'massageTime': DateTime.now(),
                            'id': email,
                          });
                          massageController.clear();
                          _controller.animateTo(
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                          );
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: ' Type message...',
                          suffixIcon: IconButton(
                            onPressed: () {
                              massages.add({
                                'massages': massageController.text,
                                'massageTime': DateTime.now(),
                                'id': email,
                              });
                              massageController.clear();
                              _controller.animateTo(
                                0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeOut,
                              );
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Color(0xFFB81736),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
