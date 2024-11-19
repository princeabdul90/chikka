/*
* Developer: Abubakar Abdullahi
* Date: 16/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class WatchStatusScreen extends StatelessWidget {
  const WatchStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WatchStatusView();
  }
}

class WatchStatusView extends StatefulWidget {
  const WatchStatusView({super.key});

  @override
  State<WatchStatusView> createState() => _WatchStatusViewState();
}

class _WatchStatusViewState extends State<WatchStatusView> {
  late final StoryController storyController;
  final List<StoryItem> storyItems = [];

  @override
  void initState() {
    super.initState();
    storyController = StoryController();
  }

  void initStoryPageItems() {
    //for (var photoUrl in widget.status.photoUrls) {
    //   storyItems.add(
    //     StoryItem.pageImage(
    //       url: photoUrl,
    //       controller: storyController,
    //     ),
    //   );
    // }
  }

  _onVerticalSwipeComplete(Direction? direction) {
    if (direction == Direction.down) {
      Navigator.pop(context);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: storyItems.isEmpty
          ? const Loader()
          : StoryView(
              storyItems: storyItems,
              controller: storyController,
              onVerticalSwipeComplete: _onVerticalSwipeComplete,
            ),
    );
  }
}
