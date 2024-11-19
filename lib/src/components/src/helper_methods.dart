/*
* Developer: Abubakar Abdullahi
* Date: 15/11/2024
*/

import 'dart:io';

import 'package:chikka/src/components/src/helper_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:giphy_picker/giphy_picker.dart';
import 'package:image_picker/image_picker.dart';

import 'enum.dart';

/// Invoke to pick image from gallery.
Future<File?> pickImageFromGallery(BuildContext context) async {
  File? imageFile;

  try {
    XFile? file = await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 80,);

    if(file != null){
      imageFile = File(file.path);
    }
  }catch (e){
    showSnackBar(context, content: e.toString());
  }

  return imageFile;
}


/// Invoke to pick video from gallery.
Future<File?> pickVideoFromGallery(BuildContext context) async {
  File? videoFile;

  try {
    XFile? file = await ImagePicker().pickVideo(
      source: ImageSource.gallery, maxDuration: const Duration(minutes: 1));

    if(file != null){
      videoFile = File(file.path);
    }
  }catch (e){
    showSnackBar(context, content: e.toString());
  }

  return videoFile;
}

/// Invoke to pick GIF

Future<GiphyGif?> pickGIF(BuildContext context) async {
  GiphyGif? gif;
  const String giphyApiKey = 'Ue0Uh7pYHZv2ayRwW6TO8weAFxo8llon';
  try {
    gif = await GiphyPicker.pickGif(
        context: context,
        title: const Text('Pick GIF'),
        apiKey: giphyApiKey,
    );
  }catch (e) {
    showSnackBar(context, content: e.toString());
  }

  return gif;
}

/// Invoke to get file type which you are going to send.
String getFileType(MessageType messageType){
  switch(messageType){
    case MessageType.image:
      return '📷 Photo';
    case MessageType.gif:
      return 'GIF';
    case MessageType.audio:
      return '🎵 Audio';
    case MessageType.video:
      return '📸 Video';
    default:
      return 'GIF';
  }
}

