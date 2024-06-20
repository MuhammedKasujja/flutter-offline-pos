
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_kalteck_pos/core/infra.dart';
import 'package:offline_kalteck_pos/widgets/widgets.dart';

import '../bloc/auth_bloc.dart';
import '../sign_up/widgets/sign_up_form.dart';
import 'widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int currentForm = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.r),
          children: [
            const SizedBox().small(),
            Center(
              child: SizedBox(
                height: 60.h,
                width: 205.w,
                child: Image.asset(Assets.logo),
              ),
            ),
            const SizedBox().medium(),
            AppTabs(
              tabs: const ['Login', 'Sign Up'],
              onTabSelectd: (int selectedIndex) {
                setState(() {
                  currentForm = selectedIndex;
                });
              },
            ),
            const SizedBox().large(),
            currentForm == 0 ? const LoginForm() : const SignupForm(),
            const SizedBox().large(),
            const ORWidget(),
            const SizedBox().small(),
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'Continue as a ',
                  children: [
                    TextSpan(
                        text: 'Guest',
                        style: TextStyle(
                          color: AppColors.primary,
                        ))
                  ],
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.read<AuthBloc>().add(const AuthLoginAsGuest());
                      // Navigator.pushNamed(context, Routes.dashboard);
                    },
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.text1,
                  fontSize: 12.sp,
                ),
              ),
            ),
            const SizedBox().medium(),
          ],
        ),
      ),
    );
  }
}
