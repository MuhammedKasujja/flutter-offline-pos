// import 'package:dormitory_app/infra/infra.dart';
// import 'package:dormitory_app/presentation/widgets/extensions/extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';

// class NewCustomPasswordfield extends StatefulWidget {
//   final String? hint;
//   final String label;
//   final bool isNewPassword;
//   final Function(String value) onChange;
//   const NewCustomPasswordfield({
//     Key? key,
//     this.hint,
//     required this.label,
//     this.isNewPassword = true,
//   }) : super(key: key);

//   @override
//   State<NewCustomPasswordfield> createState() => _CustomPasswordfieldState();
// }

// class _CustomPasswordfieldState extends State<NewCustomPasswordfield> {
//   bool isNotVisible = true;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(widget.label).label(),
//         SizedBox(
//           height: 8.h,
//         ),
//         TextField(
//           key: Key(widget.label),
//           textInputAction: TextInputAction.go,
//           controller: widget.controller,
//           keyboardType: TextInputType.text,
//           obscureText: isNotVisible,
//           validator: widget.isNewPassword
//               ? FormBuilderValidators.compose([
//                   FormBuilderValidators.required(),
//                   FormBuilderValidators.minLength(8,
//                       errorText: 'Password must be at least 8 letters'),
//                   FormBuilderValidators.match('(?=.*[A-Z])',
//                       errorText:
//                           'Password must contain at least one uppercase letter'),
//                   FormBuilderValidators.match('(?=.*[0-9])',
//                       errorText: 'Password must contain at least one number'),
//                   FormBuilderValidators.match(r"(?=.*[!@#$&*%^])",
//                       errorText:
//                           'Password must contain at least one special letter')
//                 ])
//               : FormBuilderValidators.required(),
//           style: TextStyle(
//             fontSize: 14.sp,
//             color: Theme.of(context).colorScheme.secondary,
//           ),
//           decoration: InputDecoration(
//             isDense: true,
//             // contentPadding: EdgeInsets.all(2),
//             hintText: widget.hint,
//             hintStyle: TextStyle(
//               fontSize: 14.sp,
//               color: AppColors.text3,
//             ),
//             suffixIcon: InkWell(
//               child: isNotVisible
//                   ? Icon(
//                       Icons.visibility,
//                       color: AppColors.textHint,
//                     )
//                   : Icon(Icons.visibility_off, color: AppColors.textHint),
//               onTap: () {
//                 setState(() {
//                   isNotVisible = !isNotVisible;
//                 });
//               },
//             ),
//             suffixIconColor: Theme.of(context).primaryColor,
//             filled: true,
//             fillColor: AppColors.backgroundLight,
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
