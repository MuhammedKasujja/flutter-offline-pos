import 'package:flutter/material.dart';
import 'package:offline_kalteck_pos/core/infra.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            side: BorderSide(color: AppColors.primary),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 12.r)),
        child: Text(
          label,
          style: TextStyle(
            color: AppColors.text500,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
