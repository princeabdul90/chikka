/*
* Developer: Abubakar Abdullahi
* Date: 16/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:flutter/material.dart';

class CallLogScreen extends StatelessWidget {
  const CallLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CallLogView();
  }
}


class CallLogView extends StatelessWidget {
  const CallLogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addVerticalSpace(48.0),
            Text(
              'Incoming Call',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 36.0),
            ),

            addVerticalSpace(48.0),
            const CircleAvatar(
              radius: 64.0,
              //backgroundImage: NetworkImage(call.callerPic),
              backgroundImage: AssetImage(
                  ImagesConsts.icUserNotSelected,
              ),
            ),
            addVerticalSpace(24.0),
            Text(
              'Caller Name',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w900,
                  color: AppColors.black.withOpacity(0.7)),
            ),
            addVerticalSpace(64.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 54.0,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call_end,
                    color: AppColors.red,
                  ),
                ),
                const SizedBox(width: 48.0),
                IconButton(
                  iconSize: 54.0,
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => CallScreen(
                    //       channelId: call.callId,
                    //       call: call,
                    //       isGroupChat: false,
                    //     ),
                    //   ),
                    // );
                  },
                  icon: const Icon(
                    Icons.call,
                    color: AppColors.green,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
