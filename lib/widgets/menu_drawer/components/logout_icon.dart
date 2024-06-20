// import 'package:dormitory_app/infra/infra.dart';
// import 'package:dormitory_app/presentation/features/auth/auth.dart';
// import 'package:dormitory_app/presentation/router/router.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'drawer_item.dart';

// class LogoutIcon extends StatelessWidget {
//   const LogoutIcon({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthBloc, AuthState>(
//       builder: (context, state) {
//         if (state.status.isAuthenticated) {
//           return Container(
//             margin: EdgeInsets.symmetric(vertical: 24.r),
//             child: GestureDetector(
//               onTap: () => context.read<AuthBloc>().add(const AuthUserUnknown()),
//               child: const DrawerItem(
//                 isLogout: true,
//                 icon: Icons.logout,
//                 title: 'Logout',
//                 route: Routes.login,
//               ),
//             ),
//           );
//         }
//         return const _GuestLoginMenuItem();
//       },
//     );
//   }
// }

// class _GuestLoginMenuItem extends StatelessWidget {
//   const _GuestLoginMenuItem();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 24.r),
//       child: SizedBox(
//         width: double.infinity,
//         child: TextButton(
//           style: TextButton.styleFrom(
//             // padding: EdgeInsets.symmetric(vertical: 10.r),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.r),
//               side: const BorderSide(color: Color(0xFF1A1A1A)),
//             ),
//           ),
//           onPressed: () => Navigator.pushNamedAndRemoveUntil(
//             context,
//             Routes.login,
//             (route) => false,
//           ), //Navigator.pushNamed(context, Routes.login),
//           child: Text(
//             'Login/Sign Up',
//             style: TextStyle(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w600,
//               height: 1.5,
//               color: const Color(0xFF1A1A1A),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
