import 'dart:io';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:noticeboard/designs/app_colors.dart';
import 'package:noticeboard/designs/app_strings.dart';

class AuthenticationLayout extends StatelessWidget {
  const AuthenticationLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _emptySizedBox(),
          _houseEmoji(5.0),
          _loginTitle(),
          _emptySizedBox(),
          _chooseAuthButton(),
          _emptySizedBox(),
        ],
      ),
    );
  }

  _houseEmoji(double borderWidth) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(32.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.symmetric(
            horizontal: BorderSide(
              color: AppColors.authBorderHouseEmoji,
              width: borderWidth,
            ),
            vertical: BorderSide(
              color: AppColors.authBorderHouseEmoji,
              width: borderWidth,
            ),
          ),
          color: AppColors.authBackgroundHouseEmoji,
        ),
        child: const Text(
          "🏠",
          style: TextStyle(
            fontSize: 100.0,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }

  _loginTitle() {
    return const Text(
      AppStrings.loginTitle,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32.0,
        color: AppColors.loginTitle,
        decoration: TextDecoration.none,
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
        onPressed: () {},
      );
    } else if (Platform.isIOS) {
      return AppleAuthButton(
        text: AppStrings.appleLoginText,
        onPressed: () {},
      );
    } else {
      return const Text(
        AppStrings.unknownLoginText,
        textAlign: TextAlign.center,
      );
    }
  }
}
