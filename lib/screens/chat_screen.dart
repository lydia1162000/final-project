import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colblindor2/authentication/model/user.dart';
import 'package:colblindor2/authentication/repository/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../authentication/repository/authentication_repository.dart';
import '../utils/color_utils.dart';
import 'home.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  // late User signedInUser; //this will give us the email

  String? messageText; //this will give us the message

  @override
  void initState() {
    // getMessages();
    super.initState();
    Provider.of<UserRepository>(context, listen: false).getUser();
  }

  // void getCurrentUser() {
  //   try {
  //     final user = _auth.currentUser;
  //     if (user != null) {
  //       signedInUser = user;
  //       print(signedInUser.email);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  void getMessages() async {
    final messages = await _firestore.collection('messages').get();
    for (var message in messages.docs) {
      print(message.data()); //to get the value of the key(.data())

    }
  }

  /// to show messages without click on any button */
  void messagesStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 103, 22, 106),
        title: Text('MessageMe',
            style: GoogleFonts.meriendaOne(
              fontSize: 23,
              fontWeight: FontWeight.w600,
            )),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<AuthenticationRepository>(context, listen: false)
                  .signOut();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false);
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      body: SafeArea(child: Consumer<UserRepository>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('messages')
                    .orderBy('time')
                    .snapshots(),
                builder: (context, snapshot) {
                  List<MessageLine> messageWidgets = [];
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.amber,
                      ),
                    );
                  }
                  final messages = snapshot.data!.docs;
                  for (var message in messages) {
                    final messageText = message.get('text');
                    final messageSender = message.get('sender');
                    final colorNumber = message.get('color');
                    final currentUser = _auth.currentUser!.email ?? '';

                    if (currentUser == messageSender) {
                      //the code of the message from the signed user
                    }
                    final messageWidget = MessageLine(
                      users: value.user,
                      sender: messageSender,
                      text: messageText,
                      isMe: value.user.name == messageSender,
                      color: Colors.primaries[colorNumber],
                    );
                    messageWidgets.add(messageWidget);
                  }

                  return Expanded(
                    child: ListView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        shrinkWrap: true,
                        children: messageWidgets),
                  );
                },
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: hexStringToColor("CB2B93"),
                      width: 2,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          messageText = value;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          hintText: 'Write your message here...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (messageTextController.text.isNotEmpty) {
                          _firestore.collection('messages').add({
                            'text': messageText,
                            'color': value.user.colorNumber,
                            ////////////////////
                            'sender': value.user.name,
                            'time': FieldValue.serverTimestamp()
                          });
                          messageTextController.clear();
                        } else {
                          null;
                          print(null);
                        }
                      },
                      child: Text(
                        'send',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}

class MessageLine extends StatelessWidget {
  const MessageLine(
      {Key? key,
      required this.sender,
      required this.color,
      required this.text,
      required this.isMe,
      required this.users})
      : super(key: key);
  final String sender;
  final String text;
  final bool isMe;
  final Users users;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(fontSize: 12, color: Colors.black45),
          ),
          Material(
            elevation: 5,
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))
                : const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
            color: isMe ? Colors.primaries[users.colorNumber] : color,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
