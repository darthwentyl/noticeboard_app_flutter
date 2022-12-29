import 'dart:math';

import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/const/app_icons.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/const/app_theme.dart';
import 'package:noticeboard/controllers/db_image_controller.dart';
import 'package:noticeboard/datas/post.dart';
import 'package:noticeboard/utils/get_initials.dart';
import 'package:noticeboard/utils/size_getter.dart';

class PostListViewItem extends StatelessWidget {
  PostListViewItem({Key? key, required this.post}) : super(key: key);

  Post post;
  DbImageController dbImageController = DbImageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.boxBackground,
        borderRadius: BorderRadius.all(Radius.circular(BoxTheme.radius)),
      ),
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Column(
          children: [
            _userName(),
            _title(),
            _image(context),
            _otherInfo(),
          ],
        ),
        onTap: () {
          print("InkWell tapped");
        },
      ),
    );
  }

  _userName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 22.0, // TODO: It should be calculated
          backgroundColor: AppColors.customBlue,
          child: CircleAvatar(
            backgroundColor: AppColors.boxBackground,
            child: Text(GetInitials.get(
                post.author)), // TODO: It should be taken from user profile
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          post.author,
          style: const TextStyle(
            color: AppColors.customBlue,
            fontSize: 20.0, // TODO: Is it circle avatar radius?
            decoration: TextDecoration.none,
          ),
        ),
        const Spacer(),
        // TODO: only administrator have this feature
        IconButton(
          color: AppColors.customWhite,
          icon: AppIcons.trash,
          onPressed: () {
            print("Trash clicked");
          },
        ),
      ],
    );
  }

  _title() {
    return Text(post.title,
        style: const TextStyle(fontSize: 12, color: AppColors.customWhite));
  }

  _image(BuildContext context) {
    // TODO: the image should be taken from DB
    return dbImageController.getImage('assets/icons/logo.svg') ??
        const SizedBox.shrink();
  }

  _otherInfo() {
    return Row(
      children: [
        badge.Badge(
          position: badge.BadgePosition.bottomEnd(bottom: 0, end: 0),
          badgeContent: Text(
            '${post.emotion.likes}',
            style: const TextStyle(
              color: AppColors.customWhite,
              fontSize: 10.0,
              decoration: TextDecoration.none,
            ),
          ),
          child: IconButton(
            color: AppColors.heartColorIcon,
            icon: AppIcons.heart,
            onPressed: () {
              // TODO: implements action
              print("Heart clicked");
            },
          ),
        ),
        const Spacer(),
        badge.Badge(
          badgeColor: AppColors.customBlue,
          shape: badge.BadgeShape.square,
          borderRadius: BorderRadius.circular(2.0),
          padding: const EdgeInsets.all(0.0),
          position: badge.BadgePosition.bottomStart(start: 0, bottom: -2.0),
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
      ],
    );
  }
}
