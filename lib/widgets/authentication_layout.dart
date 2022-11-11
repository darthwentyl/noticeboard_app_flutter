import 'dart:io';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/controllers/login_controller.dart';
import 'package:noticeboard/pages/robot_verify_page.dart';

class AuthenticationLayout extends StatefulWidget {
  const AuthenticationLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthenticationLayoutState();
}

class _AuthenticationLayoutState extends State<AuthenticationLayout> {
  final LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.authBackgroundHouseEmoji,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _emptySizedBox(),
            _houseEmoji(5.0),
            _emptySizedBox(),
            _chooseAuthButton(),
            _emptySizedBox(),
          ],
        ),
      ),
    );
  }

  _houseEmoji(double borderWidth) {
    return Center(
      child: SvgPicture.asset(
        'assets/icons/logo.svg',
      ),
    );
  }

  _emptySizedBox() {
    return const SizedBox(
      height: 16.0,
    );
  }

  _chooseAuthButton() {
    if (Platform.isAndroid) {
      return GoogleAuthButton(
        text: AppStrings.googleLoginText,
        onPressed: () {
          if (_loginController.login()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RobotVerifyPage(),
                fullscreenDialog: true,
              ),
            );
          }
        },
      );
      //  TODO: add any action for IOS system!!!
    } else if (Platform.isIOS) {
      return AppleAuthButton(
        text: AppStrings.appleLoginText,
        onPressed: () {},
      );
    } else {
      return AlertDialog(
        title: const Text(ErrStrings.errStr),
        content: const Text(ErrStrings.unknownOS),
        actions: [
          TextButton(
            child: const Text(ButtonStrings.back),
            onPressed: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),
        ],
      );
    }
  }
}
