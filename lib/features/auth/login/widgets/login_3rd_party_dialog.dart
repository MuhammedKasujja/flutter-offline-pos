
import 'package:flutter/material.dart';
import 'package:offline_kalteck_pos/core/infra.dart';
import 'package:offline_kalteck_pos/widgets/extensions/extensions.dart';

class Login3rdPartyDialog extends StatelessWidget {
  final String title;
  final String body;
  final Function onAction;
  const Login3rdPartyDialog({
    super.key,
    required this.title,
    required this.body,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
       contentPadding: EdgeInsets.all(20.r),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.text1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox().scaleHeight(12),
          Center(
            child: Text(
              body,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.text2,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
          ),
          const SizedBox().medium(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onAction();
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
