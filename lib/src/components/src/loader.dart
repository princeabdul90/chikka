/*
* Developer: Abubakar Abdullahi
* Date: 15/11/2024
*/

import 'package:flutter/material.dart';

import 'app_colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: CircularProgressIndicator(
        color: AppColors.black,
      ),
    );
  }
}
