import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/const/app_theme.dart';
import 'package:noticeboard/controllers/db_image_controller.dart';
import 'package:noticeboard/datas/promotion_types.dart';
import 'package:noticeboard/utils/size_getter.dart';

class PromotionWidget extends StatelessWidget {
  PromotionWidget({required this.promotionTypes, Key? key}) : super(key: key);

  final Map<EPromotionTypes, String> infoMsg = {
    EPromotionTypes.promotion: AppStrings.promotionInfo,
    EPromotionTypes.contest: AppStrings.contestInfo
  };

  EPromotionTypes promotionTypes;
  DbImageController dbImageController = DbImageController();

  @override
  Widget build(BuildContext context) {
    String msg = infoMsg[promotionTypes] ?? '';
    return Expanded(
      child: Container(
        width: SizeGetter.width(context, 98.0),
        decoration: const BoxDecoration(
          color: AppColors.boxBackground,
          borderRadius: BorderRadius.all(Radius.circular(BoxTheme.radius)),
        ),
        child: _getPromotion() ??
            Center(
              child: Text(
                msg + ' abc@def.gh',
                style: const TextStyle(
                    fontSize: 24.0, color: AppColors.customWhite),
              ),
            ),
      ),
    );
  }

  _getPromotion() {
    if (promotionTypes == EPromotionTypes.promotion) {
      return dbImageController.getImage('assets/example/cafe_promotion.svg');
    } else {
      return dbImageController.getImage('assets/example/cafe_contest.svg');
    }
  }
}
