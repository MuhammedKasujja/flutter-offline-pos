
import 'package:flutter/material.dart';
import 'package:offline_kalteck_pos/core/infra.dart';
import 'package:offline_kalteck_pos/widgets/extensions/extensions.dart';

class CustomPasswordfield extends StatefulWidget {
  final String? hint;
  final String label;
  final bool isNewPassword;
  final Function(String value) onChange;
  final String? errorText;
  const CustomPasswordfield({
    Key? key,
    this.hint,
    required this.label,
    this.isNewPassword = true,
    required this.onChange, this.errorText,
  }) : super(key: key);

  @override
  State<CustomPasswordfield> createState() => _CustomPasswordfieldState();
}

class _CustomPasswordfieldState extends State<CustomPasswordfield> {
  bool isNotVisible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label).label(hasError: widget.errorText!= null),
        SizedBox(
          height: 8.h,
        ),
        TextField(
          key: Key(widget.label),
          textInputAction: TextInputAction.next,
          onChanged: widget.onChange,
          keyboardType: TextInputType.text,
          obscureText: isNotVisible,
          style: TextStyle(
            fontSize: 14.sp,
            color: Theme.of(context).colorScheme.secondary,
          ),
          decoration: InputDecoration(
            isDense: true,
            // contentPadding: EdgeInsets.all(2),
            hintText: widget.hint,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: AppColors.text3,
            ),
            errorText: widget.errorText,
            suffixIcon: InkWell(
              child: isNotVisible
                  ? Icon(
                      Icons.visibility,
                      color: AppColors.textHint,
                    )
                  : Icon(Icons.visibility_off, color: AppColors.textHint),
              onTap: () {
                setState(() {
                  isNotVisible = !isNotVisible;
                });
              },
            ),
            suffixIconColor: Theme.of(context).primaryColor,
            filled: true,
            fillColor: AppColors.backgroundLight,
            focusedBorder:
                AppStyles.buildInputBorder(state: InputState.focused),
            errorBorder: AppStyles.buildInputBorder(state: InputState.error),
            border: AppStyles.buildInputBorder(),
            enabledBorder: AppStyles.buildInputBorder(),
          ),
        ),
      ],
    );
  }
}
