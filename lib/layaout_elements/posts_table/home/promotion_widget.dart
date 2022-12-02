import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/const/app_theme.dart';
import 'package:noticeboard/controllers/db_image_controller.dart';
import 'package:noticeboard/utils/size_getter.dart';

class PromotionWidget extends StatelessWidget {
  PromotionWidget({Key? key}) : super(key: key);

  DbImageController dbImageController = DbImageController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: SizeGetter.width(context, 98.0),
        decoration: const BoxDecoration(
          color: AppColors.boxBackground,
          borderRadius: BorderRadius.all(Radius.circular(BoxTheme.radius)),
        ),
        child: _getPromotion() ??
            const Center(
              child: Text(
                AppStrings.promotionAnnouncement + ' abc@def.gh',
                style: TextStyle(fontSize: 24.0, color: AppColors.customWhite),
              ),
            ),
      ),
    );
  }

  _getPromotion() {
    return dbImageController.getImage('assets/example/cafe_promotion.svg');
  }
}
