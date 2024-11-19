/*
* Developer: Abubakar Abdullahi
* Date: 18/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:flutter/material.dart';

class GroupContactListWidget extends StatelessWidget {
  const GroupContactListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(

        child: ListView.builder(
          itemCount: 20,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: () {},
                    title: const Text('Name'),
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage(
                          ImagesConsts.icUserNotSelected
                        //status.profilePic!,
                      ),
                    ),
                    trailing:  const Icon(
                      Icons.done,
                      color: AppColors.black,
                    ),
                  ),
                  const Divider(
                    indent: 50.0,
                    endIndent: 50.0,
                    height: 1.0,
                  )
                ],
              );
            },


        ),
    );
  }
}
