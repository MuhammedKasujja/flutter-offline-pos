// import 'package:dormitory_app/infra/infra.dart';
// import 'package:dormitory_app/presentation/features/auth/auth.dart';
// import 'package:dormitory_app/presentation/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ProfileHeader extends StatelessWidget {
//   const ProfileHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(32.r, (kToolbarHeight + 24).r, 16.r, 40.r),
//       color: Colors.black,
//       width: double.infinity,
//       child: BlocBuilder<AuthBloc, AuthState>(
//         builder: (context, state) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50.r),
//                   color: AppColors.background,
//                 ),
//                 child: SizedBox(
//                   width: 64.w,
//                   height: 64.w,
//                   child: ImageLoader(
//                     imageUrl: state.user?.photoUrl,
//                     placeholderImage: Assets.missingProfile,
//                   ),
//                 ),
//               ),
//               Spacing.small(),
//               Text(
//                 state.user != null ? state.user!.name : 'Guest',
//                 style: TextStyle(
//                   fontSize: 20.sp,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white,
//                 ),
//               ),
//               state.status.isAuthenticated
//                   ? Text(
//                       state.user!.email,
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                         color: const Color(0xFFC3C6D2),
//                       ),
//                     )
//                   : const SizedBox.shrink(),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
