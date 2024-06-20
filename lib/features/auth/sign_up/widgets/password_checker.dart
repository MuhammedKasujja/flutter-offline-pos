
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:offline_kalteck_pos/core/infra.dart';
import 'package:offline_kalteck_pos/core/validations/validations.dart';
import 'package:offline_kalteck_pos/widgets/widgets.dart';

class NewPasswordChecker extends StatelessWidget {
  final NewPasswordValidationError? validator;
  const NewPasswordChecker({super.key, required this.validator});

  @override
  Widget build(BuildContext context) {
    if (validator == null) return const SizedBox.shrink();
    return Column(
      children: [
        const SizedBox().scaleHeight(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _CheckerMessage(
              message: 'Minimum of 8 characters',
              hasError: validator!.isEmpty || validator!.isShort,
            ),
            _CheckerMessage(
              message: 'Atleast one uppercase',
              hasError: validator!.isEmpty || validator!.noUppercase,
            ),
          ],
        ),
        const SizedBox().scaleHeight(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _CheckerMessage(
              message: 'One special character',
              hasError: validator!.isEmpty || validator!.noSpecialChar,
            ),
            _CheckerMessage(
              message: 'At least one number',
              hasError: validator!.isEmpty || validator!.noNumber,
            ),
          ],
        )
      ],
    );
  }
}

class _CheckerMessage extends StatelessWidget {
  final String message;
  final bool hasError;
  // final NewPasswordValidationError validator;
  const _CheckerMessage({required this.message, required this.hasError});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          SvgPicture.string(hasError ? Assets.errorIcon : Assets.okIcon),
          SizedBox(width: 8.w),
          Text(
            message,
            style: TextStyle(
              fontSize: 12.sp,
              height: 1.5,
              color: AppColors.text2,
            ),
          ),
        ],
      ),
    );
  }
}
