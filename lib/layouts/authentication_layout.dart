import 'dart:io';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/controllers/login_controller.dart';
import 'package:noticeboard/pages/robot_verify_page.dart';
import 'package:noticeboard/utils/empty_size_box.dart';

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
            EmptySizeBox.get(height: 16.0),
            _houseEmoji(5.0),
            EmptySizeBox.get(height: 16.0),
            _chooseAuthButton(),
            EmptySizeBox.get(height: 16.0),
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

  _chooseAuthButton() {
    if (Platform.isAndroid) {
      return GoogleAuthButton(
        text: AppStrings.googleLoginText,
        onPressed: () {
          // TODO: implements true login by google account
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
      //  TODO: implements true login by apple account
    } else if (Platform.isIOS) {
      return AppleAuthButton(
        text: AppStrings.appleLoginText,
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
