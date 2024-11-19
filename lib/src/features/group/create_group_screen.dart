/*
* Developer: Abubakar Abdullahi
* Date: 18/11/2024
*/

import 'dart:io';

import 'package:chikka/src/components/components.dart';
import 'package:flutter/material.dart';

import 'widgets/group_contact_list_widget.dart';

class CreateGroupScreen extends StatelessWidget {
  const CreateGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateGroupView();
  }
}

class CreateGroupView extends StatefulWidget {
  const CreateGroupView({super.key});

  @override
  State<CreateGroupView> createState() => _CreateGroupViewState();
}

class _CreateGroupViewState extends State<CreateGroupView> {
  late TextEditingController _groupNameController;
  File? _imageFile;
  Size? size;

  @override
  void initState() {
    super.initState();
    _groupNameController = TextEditingController();
  }

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size ??= MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme.copyWith(
          color: AppColors.onPrimary,
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new,
            //color: Colors.white,
          ),
        ),
        title: Text(
          'Create Group',
          style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
            color: AppColors.onPrimary,
            fontSize: 18.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.done),
      ),
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: size!.width * 0.90,
                height: size!.height,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    addVerticalSpace(size!.width * 0.03),
                    _buildProfileImage(),
                    addVerticalSpace(size!.width * 0.03),
                    _buildNameTF(),
                    addVerticalSpace(size!.width * 0.04),
                    _buildSelectContactHeading(),
                    const GroupContactListWidget(),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }

  Widget _buildSelectContactHeading() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Select Contacts',
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildNameTF() {
    return TextField(
      controller: _groupNameController,
      minLines: 1,
      maxLines: 1,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.group),
        hintText: 'Enter Group Name',
        hintStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
          color: AppColors.grey,
          fontSize: size!.width * 0.04,
          fontWeight: FontWeight.normal,
        ),
        isDense: true,
      ),
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
        color: AppColors.black,
        fontSize: size!.width * 0.05,
      ),
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _imageFile != null
            ? CircleAvatar(
          backgroundImage: FileImage(_imageFile!),
          radius: size!.width * 0.15,
          backgroundColor: AppColors.white,
        )
            : CircleAvatar(
          backgroundImage:
          const AssetImage(ImagesConsts.icUserNotSelected),
          radius: size!.width * 0.15,
          backgroundColor: AppColors.white,
        ),
        Positioned(
          top: (size!.width * 0.35) * 0.55,
          left: (size!.width * 0.35) * 0.55,
          child: IconButton(
            onPressed: _selectImage,
            icon: Icon(
              Icons.add_a_photo,
              size: size!.width * 0.075,
            ),
          ),
        ),
      ],
    );
  }

  void _selectImage() async {
    _imageFile = await pickImageFromGallery(context);
    setState(() {});
  }


}
