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
          badgeColor: AppColors.customBlue,
          shape: badge.BadgeShape.square,
          borderRadius: BorderRadius.circular(2.0),
          padding: const EdgeInsets.all(0.0),
          // position: badge.BadgePosition.bottomStart(start: 0, bottom: -2.0),
          badgeContent: Text(
            '${post.comments}',
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: AppColors.customWhite,
              fontSize: 10.0,
              decoration: TextDecoration.none,
            ),
          ),
          child: InkWell(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.textButtonBackground,
                borderRadius:
                    BorderRadius.all(Radius.circular(BoxTheme.radius)),
              ),
              child: AppIcons.comment,
            ),
            onTap: () {
              // TODO: implements action
              print("Comment clicked");
            },
          ),
        ),
        EmptySizeBox.get(width: 30),
      ],
    );
  }

  _getBadge(EEmotion emotion) {
    return badge.Badge(
      // position: badge.BadgePosition.bottomEnd(bottom: -8, end: -12),
      badgeContent: Text(
        _getEmotionNum(emotion),
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
