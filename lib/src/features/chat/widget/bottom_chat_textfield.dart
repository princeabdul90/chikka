/*
* Developer: Abubakar Abdullahi
* Date: 18/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:chikka/src/features/chat/widget/build_icon_button_widget.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

import 'pop_menu_item_widget.dart';

class BottomChatTextField extends StatelessWidget {
  const BottomChatTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomChatTextFieldView();
  }
}

class BottomChatTextFieldView extends StatefulWidget {
  const BottomChatTextFieldView({super.key});

  @override
  State<BottomChatTextFieldView> createState() => _BottomChatTextFieldViewState();
}

class _BottomChatTextFieldViewState extends State<BottomChatTextFieldView> {
  late final TextEditingController _messageController;
  // late final FlutterSoundRecorder _soundRecorder;
  late final FocusNode _tfFocusNode;
  bool _isEmojiIconTapped = false;
  double? _keyboardSize;
  bool _isSoundRecorderInitialized = false;
  bool _isAudioRecording = false;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _tfFocusNode = FocusNode();
    // sound recorder
    // _soundRecorder = FlutterSoundRecorder();
    // initSoundRecorder();
  }

  /// invoke to initialize sound recorder
  // void initSoundRecorder() async {
  //   final permissionStatus = await Permission.microphone.request();
  //   if (permissionStatus != PermissionStatus.granted) {
  //     throw RecordingPermissionException('Mic permission not granted');
  //   }
  //
  //   _soundRecorder.openRecorder();
  //   _isSoundRecorderInitialized = true;
  // }

  @override
  void dispose() {
    _messageController.dispose();
    //_soundRecorder.closeRecorder();
    _isSoundRecorderInitialized = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = EdgeInsets.fromViewPadding(
        WidgetsBinding.instance.window.viewInsets,
        WidgetsBinding.instance.window.devicePixelRatio);
    if (_keyboardSize == null && viewInsets.bottom > 1) {
      _keyboardSize = viewInsets.bottom;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(2, 2),
                      ),
                      BoxShadow(
                          color: Colors.grey.shade200,
                          offset: const Offset(-2, -2),
                          blurRadius: 3,
                          spreadRadius: 1),
                    ],
                  ),
                  child: _buildChatTextField(),
                ),
              ),
              addHorizontalSpace(8.0),
              _buildMicOrSendButton(),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _isEmojiIconTapped ? _keyboardSize ?? 310 : 0.0,
            width: double.infinity,
            child: EmojiPicker(
              textEditingController: _messageController,
              onEmojiSelected: (_, __) => setState(() {}),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildChatTextField() {
    return TextField(
      minLines: 1,
      maxLines: 6,
      focusNode: _tfFocusNode,
      onChanged: (value) {
        setState(() {});
      },
      controller: _messageController,
      keyboardType: TextInputType.multiline,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.chatTFFill,
        suffixIconConstraints: const BoxConstraints(),
        prefixIcon: _buildPrefixTFIcon(),
        suffixIcon: _buildSuffixTFIcon(),
        hintText: 'Type a message...',
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.chatScreenGrey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: EdgeInsets.only(
          top: 12.0,
          bottom: 12.0,
          left: 16.0,
          right: _messageController.text.isEmpty ? 0 : 16.0,
        ),
      ),
    );
  }

  Widget _buildPrefixTFIcon() {
    return buildMaterialIconButtonWidget(
      icon: _isEmojiIconTapped ? Icons.keyboard : Icons.emoji_emotions_outlined,
      onTap: !_isEmojiIconTapped
          ? () {
        _tfFocusNode.unfocus();
        setState(() {
          _isEmojiIconTapped = true;
        });
      }
          : () async {
        setState(() {
          _isEmojiIconTapped = false;
        });

        await Future.delayed(const Duration(milliseconds: 350));
        _tfFocusNode.requestFocus();
      },
    );
  }

  Widget _buildSuffixTFIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          clipBehavior: Clip.antiAlias,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Padding(
            padding: _messageController.text.isEmpty
                ? EdgeInsets.zero
                : const EdgeInsets.only(right: 16.0),
            child: PopupMenuButton(
              padding: EdgeInsets.zero,
              itemBuilder: (context) {
                return [
                  buildPopUpMenuItemWidget(
                    Icons.video_collection_rounded,
                    'Send Video',
                        () {},
                  ),
                  buildPopUpMenuItemWidget(
                    Icons.gif,
                    'Send Gif',
                        () {},
                    //_pickAndSendGif,
                  ),
                  if (_messageController.text.isNotEmpty)
                    buildPopUpMenuItemWidget(
                      Icons.camera,
                      'Send Image',
                          () => {},
                    ),
                ];
              },
              child: const Icon(Icons.more_vert),
            ),
          ),
        ),
        if (_messageController.text.isEmpty)
          buildMaterialIconButtonWidget(
            icon: Icons.camera,
            onTap: () => {},
          ),
      ],
    );
  }

  Widget _buildMicOrSendButton() {
    return FloatingActionButton(
      onPressed: (){},
      child: Icon(
        _messageController.text.isEmpty
            ? _isAudioRecording
            ? Icons.close
            : Icons.mic
            : Icons.send,
        color: AppColors.white,
      ),
    );
  }
}
