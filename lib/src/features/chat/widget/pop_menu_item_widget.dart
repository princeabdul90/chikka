/*
* Developer: Abubakar Abdullahi
* Date: 18/11/2024
*/

import 'package:flutter/material.dart';

PopupMenuItem buildPopUpMenuItemWidget(
    IconData icon,
    String text,
    VoidCallback onPressed,
    ) {
  return PopupMenuItem(
    child: ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onPressed,
    ),
  );
}
