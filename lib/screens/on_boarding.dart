import 'dart:async';

import 'package:schoolable_app/config/ui_icons.dart';
import 'package:schoolable_app/models/chat.dart';
import 'package:schoolable_app/models/conversation.dart';
import 'package:schoolable_app/models/user.dart';
import 'package:schoolable_app/widgets/ChatMessageListItemWidget.dart';
import 'package:schoolable_app/widgets/PTAItemWidget.dart';
import 'package:flutter/material.dart';


class OnBoardingWidget extends StatefulWidget {
  @override
  _OnBoardingWidgetState createState() => _OnBoardingWidgetState();
}


class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  ConversationsList _conversationList = new ConversationsList();
  User _currentUser = new User.init().getCurrentUser();
  final _myListKey = GlobalKey<AnimatedListState>();
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("PTA Meeting",
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.brown,
                    backgroundImage: new NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR17d21Bvtz-Ua1w5v8MLQEop69a5XTZcr-jk0ukfTbupRw-g1P"),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Stack(
                    children: <Widget>[
                      Padding(
                          padding:
                          const EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 10.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Vintage Heights",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "|",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "5, January, 2020",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey),
                              )
                            ],
                          )),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(0.0, 25.0, 10.0, 10.0),
                        child: Text(
                          "To you (Tolulope Saba)",
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ]),
          ),
          Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                    "1. We now charge for Bitcoin deposit. We deduct a small fee from each Bitcoin amount you send to our app.",
                    style: TextStyle(fontSize: 12.0, color: Colors.grey)),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                    "2. We posted this notice in our community group a few days ago. But since many people missed it we decided to write it in this email as well.",
                    style: TextStyle(fontSize: 12.0, color: Colors.grey)),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("Add to Calendar",
                        style: TextStyle(fontSize: 12.0, color: Colors.blue))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Comments (2)",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))),
              ],
            ),
          ),

          Expanded(

            child: AnimatedList(
              key: _myListKey,
              reverse: true,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              initialItemCount: _conversationList.conversations[0].chats.length,
              itemBuilder: (context, index, Animation<double> animation) {
                Chat chat = _conversationList.conversations[0].chats[index];
                return ChatMessageListItem(
                  chat: chat,
                  animation: animation,
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.10), offset: Offset(0, -4), blurRadius: 10)
              ],
            ),
            child: TextField(
              controller: myController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                hintText: 'Leave a comment',
                hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.8)),
                suffixIcon: IconButton(
                  padding: EdgeInsets.only(right: 30),
                  onPressed: () {
                    setState(() {
                      _conversationList.conversations[0].chats
                          .insert(0, new Chat(myController.text, '21min ago', _currentUser));
                      _myListKey.currentState.insertItem(0);
                    });
                    Timer(Duration(milliseconds: 100), () {
                      myController.clear();
                    });
                  },
                  icon: Icon(
                    UiIcons.cursor,
                    color: Theme.of(context).accentColor,
                    size: 30,
                  ),
                ),
                border: UnderlineInputBorder(borderSide: BorderSide.none),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          )
        ],
      ),
    );
  }
}


void main() {
  runApp(OnBoardingWidget());
}