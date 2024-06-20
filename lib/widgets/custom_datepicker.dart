// import 'package:dormitory_app/infra/infra.dart';
// import 'package:dormitory_app/presentation/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';

// class CustomDatepicker extends StatelessWidget {
//   final TextEditingController? controller;
//   final String hint;
//   final String label;
//   final bool enabled;
//   final bool isDateOfirth;
//   final InputType type;
//   final bool isRequired;
//   final String? errorText;

//   const CustomDatepicker({
//     Key? key,
//     this.controller,
//     this.hint = 'MM/DD/YYYY',
//     this.enabled = true,
//     this.isDateOfirth = false,
//     this.type = InputType.date,
//     required this.label,
//     this.isRequired = true,
//     this.errorText,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label).label(),
//         const SizedBox(
//           height: 8,
//         ),
//         FormBuilderDateTimePicker(
//           inputType: type,
//           name: label,
//           enabled: enabled,
//           firstDate: type == InputType.date ? DateTime(1960) : null,
//           controller: controller,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           format: type == InputType.date
//               ? DateFormat('dd-MM-yyyy')
//               : DateFormat.E(),
//           validator: isRequired
//               ? FormBuilderValidators.compose<DateTime>(
//                   [
//                     FormBuilderValidators.required(
//                       errorText: errorText,
//                     )
//                   ],
//                 )
//               : FormBuilderValidators.compose<DateTime>([]),
//           // initialValue: (controller.text.isNotEmpty)
//           //     ? type == InputType.date
//           //         ? DateFormat('dd-MM-yyyy').parse(controller.text)
//           //         : DateFormat.Hm().parse(controller.text)
//           //     : null,
//           // valueTransformer: (date) {
//           //   return date != null ? DateFormat('DD/MM/yyyy').format(date) : null;
//           // },
//           style: TextStyle(
//             fontSize: 14.sp,
//             color: Theme.of(context).colorScheme.secondary,
//           ),
//           decoration: InputDecoration(
//             isDense: true,
//             filled: true,
//             hintText: hint,
//             hintStyle: TextStyle(
//               color: AppColors.text3,
//               fontSize: 14.sp,
//             ),
//             suffixIcon: Icon(
//               type == InputType.date
//                   ? Icons.calendar_month_outlined
//                   : Icons.access_time_filled,
//               size: 18,
//             ),
//             suffixIconColor: Colors.black,
//             focusedBorder:
//                 AppStyles.buildInputBorder(state: InputState.focused),
//             errorBorder: AppStyles.buildInputBorder(state: InputState.error),
//             border: AppStyles.buildInputBorder(),
//             enabledBorder: AppStyles.buildInputBorder(),
//           ),
//         ),
//       ],
//     );
//   }
// }
