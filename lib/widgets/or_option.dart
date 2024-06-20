import 'package:flutter/material.dart';
import 'package:offline_kalteck_pos/core/infra.dart';

class ORWidget extends StatelessWidget {
  final bool captalize;
  const ORWidget({super.key, this.captalize = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Divider(
            color: AppColors.divider,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            captalize ? 'OR' : 'Or',
            style: TextStyle(
              color: AppColors.text300,
              fontSize: 14.sp,
              height: 1.57,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.divider,
          ),
        ),
      ],
    );
  }
}
