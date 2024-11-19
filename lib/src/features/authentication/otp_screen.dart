/*
* Developer: Abubakar Abdullahi
* Date: 15/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:chikka/src/router/router.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OtpView();
  }
}

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme:
        Theme.of(context).iconTheme.copyWith(color: AppColors.onPrimary),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Enter OTP',
          style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
            color: AppColors.onPrimary,
            fontSize: 18.0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            addVerticalSpace(size.width * 0.15),
            Text(
              'We have sent an SMS with a code.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.black,
                fontSize: size.width * 0.05,
              ),
            ),
            addVerticalSpace(size.width * 0.08),

            SizedBox(
              width: size.width * 0.5,
              child: TextField(
                maxLines: 1,
                minLines: 1,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (String otp) {
                  if (otp.length == 6) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouter.userInformationScreen,
                          (route) => false,
                    );
                  }
                },
                maxLength: 6,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: '- - - - - -',
                  hintStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: AppColors.grey,
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppColors.black,
                  fontSize: size.width * 0.08,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

