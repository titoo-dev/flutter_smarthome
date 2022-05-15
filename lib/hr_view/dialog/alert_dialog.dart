import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../layout/adaptive.dart';
import '../value/colors.dart';
import '../value/sizes.dart';
import '../value/strings.dart';
import '../widgets/custom_button.dart';
import '../widgets/spaces.dart';

class AlertDialogWidget {
  void showSampleDialog({
    required BuildContext context,
    required String title,
    required String text,
  }) {
    showDialog(
      context: context,
      builder: (_) => _buildSampleDialog(
        context: context,
        title: title,
        text: text,
      ),
    );
  }

  void showConfirmDialog(
      {required BuildContext context,
      required String title,
      required String text,
      required VoidCallback? onConfirmTap}) {
    showDialog(
      context: context,
      builder: (_) => _buildConfirmDialog(
        context: context,
        title: title,
        text: text,
        onConfirmTap: onConfirmTap,
      ),
    );
  }

  Widget _buildSampleDialog({
    required BuildContext context,
    required String title,
    required String text,
  }) {
    ThemeData theme = Theme.of(context);
    Radius borderRadius = const Radius.circular(Sizes.RADIUS_60);
    return Dialog(
      backgroundColor: AppColors.violet400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: borderRadius,
          bottomLeft: borderRadius,
        ),
      ),
      elevation: Sizes.ELEVATION_8,
      child: Container(
        padding: const EdgeInsets.all(Sizes.MARGIN_30),
        height: assignHeight(context: context, fraction: 0.25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.headline6?.copyWith(
                color: AppColors.white,
              ),
            ),
            SpaceH8(),
            Text(
              text,
              style: theme.textTheme.bodyText2?.copyWith(
                color: AppColors.purple50,
              ),
            ),
            SpaceH24(),
            CustomButton(
              title: StringConst.ok,
              height: Sizes.HEIGHT_44,
              textStyle: theme.textTheme.subtitle2?.copyWith(
                color: AppColors.white,
              ),
              color: AppColors.primaryColor,
              onPressed: () => closeDialog(),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmDialog(
      {required BuildContext context,
      required String title,
      required String text,
      required VoidCallback? onConfirmTap}) {
    ThemeData theme = Theme.of(context);
    Radius borderRadius = const Radius.circular(Sizes.RADIUS_60);
    return Dialog(
      backgroundColor: AppColors.violet400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: borderRadius,
          bottomLeft: borderRadius,
        ),
      ),
      elevation: Sizes.ELEVATION_8,
      child: Container(
        padding: const EdgeInsets.all(Sizes.MARGIN_30),
        height: assignHeight(context: context, fraction: 0.25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.headline6?.copyWith(
                color: AppColors.white,
              ),
            ),
            SpaceH8(),
            Text(
              text,
              style: theme.textTheme.bodyText2?.copyWith(
                color: AppColors.purple50,
              ),
            ),
            SpaceH24(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () => closeDialog(),
                  backgroundColor: AppColors.pink50,
                  child: const Icon(
                    Icons.close,
                    color: AppColors.white,
                  ),
                ),
                SpaceW8(),
                FloatingActionButton(
                  onPressed: onConfirmTap,
                  backgroundColor: AppColors.primaryColor,
                  child: const Icon(
                    Icons.done,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void closeDialog() {
    Get.back();
  }
}
