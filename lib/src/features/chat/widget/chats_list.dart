/*
* Developer: Abubakar Abdullahi
* Date: 18/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:chikka/src/router/router.dart';
import 'package:flutter/material.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ChatTile(
          onTap: () => Navigator.pushNamed(
            context,
            AppRouter.chatScreen,
          ),
          title: 'Chat Name',
          message: 'Chat Message',
        );
    },);
  }
}


