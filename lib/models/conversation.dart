import 'package:schoolable_app/models/chat.dart';
import 'package:schoolable_app/models/user.dart';
import 'package:flutter/material.dart';

class Conversation {
  String id = UniqueKey().toString();
  List<Chat> chats;
  bool read;
  User user;

  Conversation(this.user, this.chats, this.read);
}

class ConversationsList {
  List<Conversation> _conversations;
  User _currentUser = new User.init().getCurrentUser();

  ConversationsList() {
    this._conversations = [
      new Conversation(
          new User.basic('Vintage Heights', 'img/user1.jpg', UserState.available),
          [
            new Chat('How are you Vintage', '4min ago',
                new User.basic('Vintage Heights', 'img/user1.jpg', UserState.available)),
            new Chat('This is how a comment will look on the mobile Application.', '2min ago', _currentUser),
            new Chat(
                'This is how we look on the Mobile Application', '1min ago', new User.basic('Vintage Heights', 'img/user1.jpg', UserState.available))
          ],
          false),

    ];
  }

  List<Conversation> get conversations => _conversations;
}
