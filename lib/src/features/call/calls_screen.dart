/*
* Developer: Abubakar Abdullahi
* Date: 16/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Calls',
        style: TextStyle(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }
}