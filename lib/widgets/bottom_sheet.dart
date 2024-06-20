
import 'package:flutter/material.dart';
import 'package:offline_kalteck_pos/core/infra.dart';

class BaseBottomSheet extends StatelessWidget {
  final String title;
  final Widget content;
  final bool hasClose;
  const BaseBottomSheet({
    super.key,
    required this.title,
    required this.content,
    this.hasClose = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.r, bottom: 0),
      child: Wrap(
        children: [
          Center(
            child: Container(
              height: 5.h,
              width: 36.w,
              decoration: BoxDecoration(
                color: AppColors.divider,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.r, 19.r, 16.r, 16.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.text1,
                  ),
                ),
                if (hasClose)
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close),
                  )
              ],
            ),
          ),
          const Divider(thickness: 1, height: 1),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: content,
          ),
        ],
      ),
    );
  }
}
