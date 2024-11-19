import 'package:chikka/src/components/components.dart';
import 'package:chikka/src/features/features.dart';
import 'package:chikka/src/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringsConsts.appName,
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      //todo: update home value to check if user is authenticated and display home
      //home: const LandingScreen(),
      home: const HomeScreen(),
      onGenerateRoute: AppRouter.onGenerateRoute
    );
  }
}
