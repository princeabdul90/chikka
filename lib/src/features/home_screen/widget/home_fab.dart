/*
* Developer: Abubakar Abdullahi
* Date: 16/11/2024
*/

import 'dart:io';

import 'package:chikka/src/components/components.dart';
import 'package:chikka/src/router/router.dart';
import 'package:flutter/material.dart';

class HomeFab extends StatefulWidget {
  const HomeFab({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<HomeFab> createState() => _HomeFabState();
}

class _HomeFabState extends State<HomeFab> {
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() {
      setState(() {
        widget.tabController.indexIsChanging;
        print('FAB: ${widget.tabController.indexIsChanging}, ${widget.tabController.index}');
      });
    });
  }


  void _selectAndConfirmImage() async {
    File? imageFile = await pickImageFromGallery(context);
    if (imageFile != null) {
      if (!mounted) return;
      Navigator.pushNamed(
        context,
        AppRouter.confirmStatusScreen,
        arguments: imageFile,
      );
    } else {
      if (!mounted) return;
      showSnackBar(context, content: 'Image not selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget.tabController.index == 0
            ? GestureDetector(
                onTap: ()=>Navigator.pushNamed(context, AppRouter.groupChatScreen),
                child: const CircleAvatar(
                  radius: 24.0,
                  backgroundColor: AppColors.primary,
                  child: Icon(
                    Icons.group,
                    color: AppColors.white,
                  ),
                ),
              )
            : const SizedBox(),
        addVerticalSpace(16.0),
        FloatingActionButton(
          onPressed: () {
            switch (widget.tabController.index) {
              case 0:
                Navigator.pushNamed(context, AppRouter.selectContactsScreen);
                break;
              case 1:
                _selectAndConfirmImage();
                break;
              case 2:
                break;
              default:
                Navigator.pushNamed(context, AppRouter.errorScreen);
            }
          },
          child: Icon(
            widget.tabController.index == 0
                ? Icons.chat_rounded
                : widget.tabController.index == 1
                    ? Icons.image
                    : Icons.call,
          ),
        ),
      ],
    );
  }
}
