/*
* Developer: Abubakar Abdullahi
* Date: 15/11/2024
*/

import 'dart:io';

import 'package:chikka/src/components/components.dart';
import 'package:chikka/src/router/router.dart';
import 'package:flutter/material.dart';

class SenderUserInformationScreen extends StatelessWidget {
  const SenderUserInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SenderUserInfoView();
  }
}

class SenderUserInfoView extends StatefulWidget {
  const SenderUserInfoView({super.key});

  @override
  State<SenderUserInfoView> createState() => _SenderUserInfoViewState();
}

class _SenderUserInfoViewState extends State<SenderUserInfoView> {
  final TextEditingController nameController = TextEditingController();
  File? imageFile;
  String? name;

  @override
  void initState() {
    nameController.addListener(() {
      name = nameController.text;
    });
    super.initState();
  }

  void _selectImage() async {
    imageFile = await pickImageFromGallery(context);
  }

  void _saveUserInfo() async {
    if (nameController.text.isNotEmpty) {

    } else {
      showSnackBar(context, content: 'Please Enter Name');
    }
  }





  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: size.width * 0.8,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  addVerticalSpace(size.width * 0.1),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      imageFile != null
                          ? CircleAvatar(
                        backgroundImage: FileImage(imageFile!),
                        radius: size.width * 0.2,
                        backgroundColor: AppColors.white,
                      )
                          : CircleAvatar(
                        backgroundImage:
                        const AssetImage(ImagesConsts.icUserNotSelected),
                        radius: size.width * 0.2,
                        backgroundColor: AppColors.white,
                      ),
                      Positioned(
                        top: (size.width * 0.5) * 0.55,
                        left: (size.width * 0.5) * 0.55,
                        child: IconButton(
                          onPressed: _selectImage,
                          icon: Icon(
                            Icons.add_a_photo,
                            size: size.width * 0.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(size.width * 0.1),
                  TextField(
                    controller: nameController,
                    minLines: 1,
                    maxLines: 1,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Name',
                      hintStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppColors.grey,
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.normal,
                      ),
                      isDense: true,
                      border: const OutlineInputBorder(),
                    ),
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppColors.black,
                      fontSize: size.width * 0.05,
                    ),
                  ),
                  addVerticalSpace(size.width * 0.3),
                  RoundButton(
                    text: 'Save',
                    onPressed: (){
                      Navigator.pushNamed(
                        context,
                        AppRouter.homeScreen,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
