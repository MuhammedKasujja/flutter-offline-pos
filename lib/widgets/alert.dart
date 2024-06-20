
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:offline_kalteck_pos/core/infra.dart';

class Alert extends StatelessWidget {
  final String message;
  const Alert({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.error100,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          SvgPicture.string(
            Assets.errorBigIcon,
            width: 24.w,
            height: 24.w,
          ),
          SizedBox(width: 12.w),
          Flexible(
            child: Text(
              message,
              style: TextStyle(
                color: AppColors.error500,
                fontSize: 12.sp,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
