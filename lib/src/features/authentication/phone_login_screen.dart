/*
* Developer: Abubakar Abdullahi
* Date: 15/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:chikka/src/router/router.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class PhoneLoginScreen extends StatelessWidget {
  const PhoneLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PhoneLoginView();
  }
}

class PhoneLoginView extends StatefulWidget {
  const PhoneLoginView({super.key});

  @override
  State<PhoneLoginView> createState() => _PhoneLoginViewState();
}

class _PhoneLoginViewState extends State<PhoneLoginView> {
  final TextEditingController mobileController = TextEditingController();
  String? countryCode = '+63';
  String? mobileNumber;

  @override
  void initState() {
    mobileController.addListener(() {
      mobileNumber = mobileController.text;
    });
    super.initState();
  }

  void chooseCountryCode() {
    showCountryPicker(
      context: context,
      onSelect: (Country value) {
        setState(() {
          countryCode = '+${value.phoneCode}';
        });
      },
    );
  }

  void sendOTP() async {
    if (mobileNumber != null && countryCode != null) {
      Navigator.pushNamed(
        context,
        AppRouter.otpScreen,
      );
    } else {
      showSnackBar(context, content: 'Enter correct mobile number');
    }
  }

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

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
        centerTitle: true,
        title: Text(
          'Authentication',
          style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                color: AppColors.onPrimary,
                fontSize: 18.0,
              ),
        ),
      ),
      body: SizedBox(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addVerticalSpace(size.width * 0.15),
              Text(
                'Chikka will need to verify you phone number',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.black,
                      fontSize: size.width * 0.05,
                    ),
              ),
              TextButton(
                onPressed: chooseCountryCode,
                child: Text(
                  'Pick Country',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppColors.primary,
                        fontSize: size.width * 0.04,
                      ),
                ),
              ),
              addVerticalSpace(size.width * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    countryCode ?? '',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: AppColors.primary,
                          fontSize: size.width * 0.05,
                        ),
                  ),
                  addHorizontalSpace(10.0),
                  SizedBox(
                    width: size.width * 0.7,
                    child: TextField(
                      controller: mobileController,
                      maxLines: 1,
                      minLines: 1,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'Mobile Number',
                        hintStyle:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: AppColors.grey,
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.normal,
                                ),
                      ),
                      onChanged: (val){
                        if(countryCode == null && val.isNotEmpty){
                          showSnackBar(context, content: 'Select Country Code');
                          setState(() {
                            val == '';
                          });
                        }
                      },
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: AppColors.black,
                          fontSize: size.width * 0.05,
                          letterSpacing: 3),
                    ),
                  )
                ],
              ),
              addVerticalSpace(size.width * 0.3),
              RoundButton(
                text: 'Next',
                onPressed: sendOTP,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
