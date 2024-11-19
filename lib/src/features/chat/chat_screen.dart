/*
* Developer: Abubakar Abdullahi
* Date: 16/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:chikka/src/features/chat/widget/messages_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widget/bottom_chat_textfield.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatView();
  }
}

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGChat,
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 32.0,
        elevation: 1,
        shadowColor: AppColors.white,
        backgroundColor: AppColors.chatAppBar,
        iconTheme: Theme.of(context).iconTheme.copyWith(
          color: AppColors.primary,
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new,
            //color: Colors.white,
          ),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                r'https://images.pexels.com/photos/13728847/pexels-photo-13728847.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              ),
            ),
            addHorizontalSpace(12.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Username',
                  style: GoogleFonts.poppins(
                    color: AppColors.lightBlack,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                   'online',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(0.0),
            icon: const Icon(
              Icons.phone_outlined,
              color: AppColors.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(0.0),
            icon: const Icon(
              Icons.videocam_outlined,
              color: AppColors.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(0.0),
            icon: const Icon(
              Icons.more_vert,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      body:  const Column(
        children: [
          Expanded(child: MessagesList()),
          BottomChatTextField()
        ],
      ),
    );
  }
}
