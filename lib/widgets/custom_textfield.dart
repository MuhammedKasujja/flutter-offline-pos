
import 'package:flutter/material.dart';
import 'package:offline_kalteck_pos/core/infra.dart';
import 'package:offline_kalteck_pos/widgets/widgets.dart';

class CustomTextfield extends StatelessWidget {
  final Function(String value) onChange;
  final String? hint;
  final String label;
  final TextInputType inputType;
  final String? errorText;
  final bool enabled;
  final String? initialValue;
  const CustomTextfield({
    Key? key,
    this.hint,
    required this.label,
    required this.onChange,
    this.inputType = TextInputType.text,
    this.errorText,
    this.enabled = true,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label).label(hasError: errorText != null),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          key: Key(label),
          initialValue: initialValue,
          textInputAction: TextInputAction.next,
          onChanged: onChange,
          keyboardType: inputType,
          maxLines: inputType == TextInputType.multiline ? 5 : 1,
          style: TextStyle(
            fontSize: 14.0,
            color: enabled
                ? Theme.of(context).colorScheme.secondary
                : AppColors.text300,
          ),
          decoration: InputDecoration(
            enabled: enabled,
            isDense: true,
            // remove un neccessary padding using negative value
            // contentPadding: const EdgeInsets.symmetric(
            //   vertical: -10,
            //   horizontal: 10,
            // ),
            hintText: hint,
            errorText: errorText,
            hintStyle: TextStyle(
              color: AppColors.text3,
              fontSize: 14.sp,
            ),
            fillColor: AppColors.backgroundLight,
            filled: true,
            errorStyle: TextStyle(color: Colors.red, fontSize: 16.sp),
            focusedBorder:
                AppStyles.buildInputBorder(state: InputState.focused),
            errorBorder: AppStyles.buildInputBorder(state: InputState.error),
            border: AppStyles.buildInputBorder(),
            enabledBorder: AppStyles.buildInputBorder(),
            disabledBorder: AppStyles.buildInputBorder(),
          ),
        ),
      ],
    );
  }
}
