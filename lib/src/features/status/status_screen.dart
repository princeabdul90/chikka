/*
* Developer: Abubakar Abdullahi
* Date: 16/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:chikka/src/router/router.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatListWidget();
  }
}


class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
      return ChatListItemWidget(index: index);
    },);
  }
}


class ChatListItemWidget extends StatelessWidget {
  const ChatListItemWidget({super.key, required this.index});

  final int index;
  //final Status status;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRouter.watchStatusScreen,
            //arguments: status,
          );
        },
        title: Text('username', style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: size.width * 0.045,
        ),),
        leading: const CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage(
              ImagesConsts.icUserNotSelected
            //status.profilePic!,
          ),
        ),
        trailing: Text(
          DateFormat.Hm().format(DateTime.now()),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: size.width * 0.030,
          ),
        ),
      ),
    );
  }
}
