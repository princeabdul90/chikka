/*
* Developer: Abubakar Abdullahi
* Date: 18/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:flutter/material.dart';

Widget buildMaterialIconButtonWidget({
  required IconData icon,
  required VoidCallback onTap,
}) {
  return Material(
    clipBehavior: Clip.antiAlias,
    color: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100.0),
    ),
    child: IconButton(
      onPressed: onTap,
      splashColor: AppColors.grey,
      icon: Icon(
        icon,
        color: AppColors.chatScreenGrey,
      ),
    ),
  );
}
