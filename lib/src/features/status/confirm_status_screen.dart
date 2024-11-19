/*
* Developer: Abubakar Abdullahi
* Date: 16/11/2024
*/

import 'dart:io';

import 'package:flutter/material.dart';

class ConfirmStatusScreen extends StatelessWidget {
  const ConfirmStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConfirmStatusView();
  }
}


class ConfirmStatusView extends StatefulWidget {
  const ConfirmStatusView({super.key});

  @override
  State<ConfirmStatusView> createState() => _ConfirmStatusViewState();
}

class _ConfirmStatusViewState extends State<ConfirmStatusView> {

  @override
  Widget build(BuildContext context) {
    final File imageFile = ModalRoute.of(context)?.settings.arguments as File;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Want to add to status?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.file(
              imageFile,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.done,
          color: Colors.white,
        ),
        onPressed: () =>  Navigator.pop(context),
      ),
    );
  }
}
