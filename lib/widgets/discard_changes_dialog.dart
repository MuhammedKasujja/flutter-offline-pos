import 'package:offline_kalteck_pos/core/infra.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:offline_kalteck_pos/widgets/extensions/extensions.dart';

import 'custom_button.dart';
import 'secondary_button.dart';
import 'spacing.dart';

class DiscardChangesDialog extends StatelessWidget {
  const DiscardChangesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(20.r),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      content: Column(
        mainAxisSize: MainAxisSize.min, // prevent Column to expand full height
        children: [
          SizedBox(
            width: 64.w,
            height: 64.w,
            child: SvgPicture.string(Assets.errorBigIcon),
          ),
          Spacing.medium(),
          Text(
            'Are you sure you want to discard the changes',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              height: 1.25,
              color: AppColors.text1,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.16.sp,
            ),
          ),
          const SizedBox().medium(),
          Row(
            children: [
              Flexible(
                child: SecondaryButton(
                  label: 'Cancel',
                  onPressed: () => Navigator.pop(context, false),
                ),
              ),
              SizedBox(width: 16.w),
              Flexible(
                child: CustomButton(
                  onPressed: () => Navigator.pop(context, true),
                  label: 'Discard',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
