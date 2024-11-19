/*
* Developer: Abubakar Abdullahi
* Date: 15/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:chikka/src/router/router.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LandingView();
  }
}


class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return  Scaffold(
      body: SafeArea(
          child: SizedBox(
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //todo: Add landing page hero image
                Column(
                  children: [
                    Text(
                      'Welcome To Chikka',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: size.width * 0.08,
                      ),
                    ),
                    addVerticalSpace(size.width * 0.08),
                    Text(
                      'Easy and free, you can get all features here.',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: size.width * 0.04,
                          color: AppColors.grey,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  ],
                ),

                RoundButton(
                    text: 'Get Started',
                    onPressed: (){
                      Navigator.pushNamed(
                        context,
                        AppRouter.loginScreen,
                      );
                    },
                )
              ],
            ),
          ),
      ),
    );
  }
}
