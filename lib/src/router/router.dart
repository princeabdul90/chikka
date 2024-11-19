/*
* Developer: Abubakar Abdullahi
* Date: 15/11/2024
*/

import 'package:chikka/src/components/src/screen_error.dart';
import 'package:chikka/src/features/features.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_route_animator/page_route_animator.dart';

class AppRouter {
  static const String homeScreen = '/';
  static const String landingScreen = '/landing';
  static const String loginScreen = '/login';
  static const String otpScreen = '/otp';
  static const String userInformationScreen = '/user-information';
  static const String selectContactsScreen = '/select-contact';
  static const String chatScreen = '/chat';
  static const String statusScreen = '/status';
  static const String confirmStatusScreen = '/confirm-status';
  static const String watchStatusScreen = '/watch-status';
  static const String createGroupScreen = '/create-group';
  static const String groupChatScreen = '/group-chats';
  static const String errorScreen = '/error';

  static Route<PageRouteAnimator>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return PageRouteAnimator(
            child: const HomeScreen(),
            routeAnimation: RouteAnimation.rightToLeft,
            settings: settings,
        );
      case landingScreen:
        return PageRouteAnimator(
          child: const LandingScreen(),
          routeAnimation: RouteAnimation.rightToLeft,
          settings: settings,
        );
      case loginScreen:
        return PageRouteAnimator(
          duration: const Duration(milliseconds: 150),
          reverseDuration: const Duration(milliseconds: 150),
          child: const PhoneLoginScreen(),
          routeAnimation: RouteAnimation.rightToLeft,
          settings: settings,
        );
      case otpScreen:
        return PageRouteAnimator(
          duration: const Duration(milliseconds: 150),
          reverseDuration: const Duration(milliseconds: 150),
          child: const OtpScreen(),
          routeAnimation: RouteAnimation.rightToLeft,
          settings: settings,
        );

      case userInformationScreen:
        return PageRouteAnimator(
          duration: const Duration(milliseconds: 150),
          reverseDuration: const Duration(milliseconds: 150),
          child: const SenderUserInformationScreen(),
          routeAnimation: RouteAnimation.rightToLeft,
          settings: settings,
        );

      case chatScreen:
        return PageRouteAnimator(
          duration: const Duration(milliseconds: 150),
          reverseDuration: const Duration(milliseconds: 150),
          child: const ChatScreen(),
          routeAnimation: RouteAnimation.rightToLeft,
          settings: settings,
        );

      case selectContactsScreen:
        return PageRouteAnimator(
          duration: const Duration(milliseconds: 150),
          reverseDuration: const Duration(milliseconds: 150),
          child: const ContactScreen(),
          routeAnimation: RouteAnimation.rightToLeft,
          settings: settings,
        );

      case groupChatScreen:
        return PageRouteAnimator(
          duration: const Duration(milliseconds: 150),
          reverseDuration: const Duration(milliseconds: 150),
          child: const GroupScreen(),
          routeAnimation: RouteAnimation.rightToLeft,
          settings: settings,
        );

      case createGroupScreen:
        return PageRouteAnimator(
          duration: const Duration(milliseconds: 150),
          reverseDuration: const Duration(milliseconds: 150),
          child: const CreateGroupScreen(),
          routeAnimation: RouteAnimation.rightToLeft,
          settings: settings,
        );

      case confirmStatusScreen:
        return PageRouteAnimator(
          duration: const Duration(milliseconds: 150),
          reverseDuration: const Duration(milliseconds: 150),
          child: const ConfirmStatusScreen(),
          routeAnimation: RouteAnimation.rightToLeft,
          settings: settings,
        );

      case watchStatusScreen:
        return PageRouteAnimator(
          duration: const Duration(milliseconds: 150),
          reverseDuration: const Duration(milliseconds: 150),
          child: const WatchStatusScreen(),
          routeAnimation: RouteAnimation.rightToLeft,
          settings: settings,
        );

      default:
        return PageRouteAnimator(
            child: ErrorScreen(error: settings.arguments as String),
            routeAnimation: RouteAnimation.rightToLeft,
            settings: settings,
        );
    }
  }
}
