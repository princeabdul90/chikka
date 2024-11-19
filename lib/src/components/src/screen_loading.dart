/*
* Developer: Abubakar Abdullahi
* Date: 15/11/2024
*/

import 'package:chikka/src/components/src/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.black,
        ),
      ),
    );
  }
}