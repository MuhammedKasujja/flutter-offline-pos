
import 'package:flutter/material.dart';
import 'package:offline_kalteck_pos/core/infra.dart';

import 'spacing.dart';

class NoDataWidget extends StatelessWidget {
  final String title;
  final String message;
  final Widget icon;

  const NoDataWidget({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.r, 120.r, 16.r, 0),
      child: Column(
        children: [
          SizedBox(
            width: 178.h,
            height: 149.h,
            child: icon,
          ),
          Spacing.medium(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.text500,
              fontSize: 20.0.sp,
              fontWeight: FontWeight.w600,
              height: 1.15,
              letterSpacing: -0.2.sp,
            ),
          ),
          Spacing.xs(),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.text300,
              height: 1.57,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
