import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/const/app_theme.dart';
import 'package:noticeboard/utils/size_getter.dart';

class VerificationBox extends StatefulWidget {
  VerificationBox({Key? key, required isVerified}) : super(key: key);

  bool isVerified = false;

  @override
  State<StatefulWidget> createState() => _VerificationBoxState();
}

class _VerificationBoxState extends State<VerificationBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: SizeGetter.width(context, 98.0),
        height: SizeGetter.height(context, 50.0),
        decoration: const BoxDecoration(
          color: AppColors.boxBackground,
          borderRadius: BorderRadius.all(Radius.circular(BoxTheme.radius)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              _title(),
              _question(),
              _choose(),
            ],
          ),
        ),
      ),
    );
  }

  _title() {
    return const Align(
      alignment: Alignment.topLeft,
      child: Text(
        AppStrings.verificationTitle,
        style: TextStyle(
          color: AppColors.customBlue,
          fontSize: 16,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  _question() {
    return const Expanded(
      child: Center(
        child: Text(
          "It will be taken from the list.",
          style: TextStyle(
            color: AppColors.customWhite,
            fontSize: 26,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }

  _choose() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.textButtonBackground,
                  padding: const EdgeInsets.all(8.0),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () {},
                child: const Text(ButtonStrings.yes),
              ),
            ],
          ),
        ),
        const Text(
          '0/3',
          style: TextStyle(
            color: AppColors.customBlue,
            fontSize: 16,
            decoration: TextDecoration.none,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.textButtonBackground,
                  padding: const EdgeInsets.all(8.0),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () {},
                child: const Text(ButtonStrings.no),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
