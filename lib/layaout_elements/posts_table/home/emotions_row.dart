import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter_svg/svg.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/const/app_icons.dart';
import 'package:noticeboard/const/app_theme.dart';
import 'package:noticeboard/datas/post.dart';
import 'package:noticeboard/utils/emotion_getter.dart';
import 'package:noticeboard/utils/empty_size_box.dart';

class EmotionsRow extends StatelessWidget {
  EmotionsRow({required this.post, Key? key}) : super(key: key);

  Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _getBadge(EEmotion.likeColor),
        EmptySizeBox.get(width: 20),
        _getBadge(EEmotion.loveColor),
        EmptySizeBox.get(width: 20),
        _getBadge(EEmotion.hahaColor),
        EmptySizeBox.get(width: 20),
        _getBadge(EEmotion.angryColor),
        EmptySizeBox.get(width: 20),
        _getBadge(EEmotion.randomColor),
        const Spacer(),
        badge.Badge(
          badgeColor: AppColors.badgeBackground,
          elevation: 0,
          shape: badge.BadgeShape.square,
          position: const badge.BadgePosition(bottom: -22),
          badgeContent: Text(
            '${post.comments}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.customWhite,
              fontSize: 10.0,
              decoration: TextDecoration.none,
            ),
          ),
          child: InkWell(
            child: SizedBox(
              height: 30.0,
              width: 30.0,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.textButtonBackground,
                  borderRadius:
                      BorderRadius.all(Radius.circular(BoxTheme.buttonRadius)),
                ),
                child: AppIcons.comment,
              ),
            ),
            onTap: () {
              // TODO: implements action
              print("Comment clicked");
            },
          ),
        ),
        EmptySizeBox.get(width: 20),
      ],
    );
  }

  _getBadge(EEmotion emotion) {
    return badge.Badge(
      badgeColor: AppColors.badgeBackground,
      elevation: 0,
      shape: badge.BadgeShape.square,
      position: const badge.BadgePosition(bottom: -22),
      badgeContent: Text(
        _getEmotionNum(emotion),
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.customWhite,
          fontSize: 10.0,
          decoration: TextDecoration.none,
        ),
      ),
      child: InkWell(
        child: SizedBox(
          height: 30.0,
          width: 30.0,
          child: SvgPicture.asset(
            EmotionNameGetter().getEmotionAsset(emotion),
          ),
        ),
        onTap: () {
          // TODO: implements action
          print("${emotion} clicked");
        },
      ),
    );
  }

  _getEmotionNum(EEmotion emotion) {
    switch (emotion) {
      case EEmotion.likeColor:
        return '${post.emotion.likes}';
      case EEmotion.loveColor:
        return '${post.emotion.loves}';
      case EEmotion.hahaColor:
        return '${post.emotion.hahas}';
      case EEmotion.angryColor:
        return '${post.emotion.angries}';
      case EEmotion.randomColor:
        return '${post.emotion.randoms}';
    }
  }
}
