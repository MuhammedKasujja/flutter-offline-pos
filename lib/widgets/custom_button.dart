import 'package:flutter/material.dart';
import 'package:offline_kalteck_pos/core/infra.dart';

class CustomButton extends StatelessWidget {
  final bool loading;
  final void Function()? onPressed;
  final String label;
  final bool isElevated;
  const CustomButton({
    Key? key,
    this.loading = false,
    required this.onPressed,
    required this.label,
    this.isElevated = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12.r),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: isElevated ? null : 0,
          backgroundColor: AppColors.primary,
        ),
        onPressed: onPressed,
        child: loading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 18.h,
                    width: 28.w,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0).r,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 2.r,
                      ),
                    ),
                  ),
                ],
              )
            : Text(
                label,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
