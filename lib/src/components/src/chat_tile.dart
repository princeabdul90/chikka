/*
* Developer: Abubakar Abdullahi
* Date: 18/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, required this.onTap, required this.title, required this.message});

  final VoidCallback onTap;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: const CircleAvatar(
        radius: 25.0,
        backgroundImage: AssetImage(
            ImagesConsts.icUserNotSelected
          //status.profilePic!,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontSize: size.width * 0.045),
      ),
      subtitle: Text(
        message,
        maxLines: 1,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontSize: size.width * 0.035),
      ),
      trailing: Text(
        DateFormat.Hm().format(DateTime.now()),
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontSize: size.width * 0.035),
      ),
      onTap: onTap,
    );
  }
}