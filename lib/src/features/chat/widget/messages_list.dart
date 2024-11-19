/*
* Developer: Abubakar Abdullahi
* Date: 18/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:chikka/src/features/chat/widget/message_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return const MessagesListView();
  }
}

class MessagesListView extends StatefulWidget {
  const MessagesListView({super.key});

  @override
  State<MessagesListView> createState() => _MessagesListViewState();
}

class _MessagesListViewState extends State<MessagesListView> {
  late final ScrollController _messagesScrollController;

  @override
  void initState() {
    super.initState();
    _messagesScrollController = ScrollController();
  }

  @override
  void dispose() {
    _messagesScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // // adding callback to new message to scroll to bottom.
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => _messagesScrollController.animateTo(
        _messagesScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      ),
    );
    return ListView.builder(
      controller: _messagesScrollController,
      itemCount: 10,
      itemBuilder: (context, index) {
        return MessageCard(
          isSender: index%2 == 0 ? true:false,
          message: 'If you use this site regularly and would like to help keep the site on the Internet, please consider donating a small sum to help pay for the hosting and bandwidth bill. There is no minimum donation, any sum is appreciated',
          time: DateFormat.Hm().format(DateTime.now()),
          //messageType: null,
          onSwipe: (val) {},
          repliedText: 'Replied Message',
          username: 'username',
          //repliedMessageType: null,
          swipeDirection: index%2 == 0 ?SwipeDirection.left : SwipeDirection.right,
          isSeen: true,
        );
      },
    );
  }
}
