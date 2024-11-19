/*
* Developer: Abubakar Abdullahi
* Date: 18/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.isSender, required this.message, required this.time, this.messageType, required this.onSwipe, required this.repliedText, required this.username, this.repliedMessageType, required this.swipeDirection, required this.isSeen});

  final bool isSender;
  final String message;
  final String time;
  final MessageType? messageType;
  final Function(DragUpdateDetails)? onSwipe;
  final String repliedText;
  final String username;
  final MessageType? repliedMessageType;
  final SwipeDirection swipeDirection;
  final bool isSeen;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SwipeTo(
      onLeftSwipe: swipeDirection == SwipeDirection.left ? onSwipe : null,
      onRightSwipe: swipeDirection == SwipeDirection.right ? onSwipe : null,
      child: Align(
        alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
        child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: size.width * 0.8,
              minWidth: 0.0,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              padding: const EdgeInsets.all(8.0),
              decoration:  BoxDecoration(
                color: isSender ? AppColors.primary : AppColors.onPrimary,
                borderRadius:  BorderRadius.only(
                  topLeft: isSender ? const Radius.circular(12.0) : Radius.zero,
                  topRight: const Radius.circular(12.0),
                  bottomLeft: const Radius.circular(12.0),
                  bottomRight: isSender ? Radius.zero : const Radius.circular(12.0),
                ),
              ),
              child: _buildMessageContent(context, repliedText.isNotEmpty),
            ),
        ),
      ),
    );
  }

  Widget _buildMessageContent(BuildContext context, bool isReplying) {
    return Column(
      crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (isReplying) ...[
          Text(
            username,
            style: isSender
                ? Theme.of(context).textTheme.headlineSmall
                : Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.black),
          ),
          addVerticalSpace(8.0),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppColors.black.withOpacity(0.3),
              borderRadius: const BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            child: DisplayMessage(
              isSender: isSender,
              message: repliedText,
              //messageType: repliedMessageType!,
            ),
          ),
        ],
        addVerticalSpace(8.0),
        DisplayMessage(
          message: message,
          isSender: isSender,
          //messageType: messageType!,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              time,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: isSender ? AppColors.chatOffWhite : AppColors.grey,
              ),
            ),
            addHorizontalSpace(4.0),
            isSender
                ? Icon(
              isSeen ? Icons.done_all : Icons.done,
              color: isSeen
                  ? AppColors.black.withOpacity(0.3)
                  : AppColors.chatOffWhite,
            )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}


class DisplayMessage extends StatelessWidget {
  const DisplayMessage({
    super.key,
    required this.message,
     this.messageType,
    required this.isSender,
  });
  final String message;
  final MessageType? messageType;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return getMessage(context);
  }

  Widget getMessage(BuildContext context) {
    return Text(
      textAlign: TextAlign.left,
      message,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: isSender ? AppColors.white : AppColors.black,
      ),
    );
    // switch (messageType) {
    //   case MessageType.text:
    //     return Text(
    //       textAlign: TextAlign.left,
    //       message,
    //       style: Theme.of(context).textTheme.labelMedium?.copyWith(
    //         color: isSender ? AppColors.white : AppColors.black,
    //       ),
    //     );
    //   // case MessageType.image:
    //   //   return CachedNetworkImage(imageUrl: message);
    //   // case MessageType.audio:
    //   //   return AudioPlayerItem(audioUrl: message, isSender: isSender);
    //   // case MessageType.gif:
    //   //   return CachedNetworkImage(imageUrl: message);
    //   // case MessageType.video:
    //   //   return VideoPlayerItem(videoUrl: message);
    //   default:
    //     return Text(
    //       textAlign: TextAlign.left,
    //       message,
    //       style: Theme.of(context).textTheme.labelMedium?.copyWith(
    //         color: isSender ? AppColors.white : AppColors.black,
    //       ),
    //     );
    // }
  }
}