
import 'package:flutter/material.dart';
import 'package:offline_kalteck_pos/core/infra.dart';
import 'package:offline_kalteck_pos/widgets/widgets.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String label;
  final String hintText;
  final List<T> items;
  final T? value;
  final String Function(T)? getLabel;
  final void Function(T?)? onChanged;
  final String? errorText;

  const CustomDropdown({
    Key? key,
    required this.label,
    this.hintText = 'please select',
    this.items = const [],
    this.getLabel,
    this.value,
    this.onChanged,
    this.errorText,
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
        FormField<T>(
          builder: (FormFieldState<T> state) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: InputDecorator(
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: AppColors.backgroundLight,
                  focusedBorder:
                      AppStyles.buildInputBorder(state: InputState.focused),
                  errorBorder:
                      AppStyles.buildInputBorder(state: InputState.error),
                  border: AppStyles.buildInputBorder(),
                  enabledBorder: AppStyles.buildInputBorder(),
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: AppColors.text3,
                    fontSize: 14.sp,
                  ),
                  errorText: errorText,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                ),
                isEmpty: value == null || value == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<T>(
                    value: value,
                    isDense: true,
                    onChanged: onChanged,
                    items: items.map((T value) {
                      return DropdownMenuItem<T>(
                        value: value,
                        child: Text(
                          getLabel!(value),
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
