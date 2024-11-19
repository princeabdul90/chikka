/*
* Developer: Abubakar Abdullahi
* Date: 18/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:chikka/src/router/router.dart';
import 'package:flutter/material.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GroupView();
  }
}

class GroupView extends StatelessWidget {
  const GroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: AppColors.onPrimary,
            ),
        title: Text(
          'Groups',
          style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                color: AppColors.onPrimary,
                fontSize: 18.0,
              ),
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new,
            //color: Colors.white,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text('Create Group'),
                onTap: () => Future(
                      () => Navigator.pushNamed(
                    context,
                    AppRouter.createGroupScreen,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ChatTile(
            onTap: () => Navigator.pushNamed(
              context,
              AppRouter.chatScreen,
            ),
            title: 'Group Name',
            message: 'Group Last Message',
          );
        },
      ),
    );
  }
}
