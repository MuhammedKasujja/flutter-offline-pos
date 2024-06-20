import 'package:flutter/material.dart';
import 'package:offline_kalteck_pos/core/infra.dart';

import 'login_3rd_party_dialog.dart';

class LoginOptionButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback onPressed;
  final String loginType;
  const LoginOptionButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.loginType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => Login3rdPartyDialog(
              title: 'Paramount Students Wants to use “$loginType” to Sign In',
              body:
                  'This allows the app and website to share information about you',
              onAction: () => onPressed,
            ),
          );
        },
        style: TextButton.styleFrom(
          side: BorderSide(color: AppColors.divider),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 12.r)
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(
                width: 16.w,
              ),
              Text(
                text,
                style: TextStyle(
                  color: AppColors.text2,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
