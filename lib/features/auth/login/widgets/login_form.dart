import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_kalteck_pos/core/infra.dart';
import 'package:offline_kalteck_pos/widgets/widgets.dart';

import '../../bloc/auth_bloc.dart';
import '../../data/repositories/auth_repository.dart';
import '../bloc/login_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => LoginBloc(authRepository: sl<AuthRepository>()),
    //   child: 
      return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status.isSuccess) {
            context.read<AuthBloc>().add(AuthUserLoggedIn(state.user!));
            // Navigator.pushNamed(context, Routes.dashboard);
          }
          if (state.status.isFailure) {
            Utility.showAlert(state.errorMessage);
          }
        },
        child: Column(
          children: [
            BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (previous, current) =>
                  previous.username != current.username,
              builder: (context, state) {
                return CustomTextfield(
                  onChange: (username) => context
                      .read<LoginBloc>()
                      .add(LoginUsernameChanged(username)),
                  label: 'Phone number or Email Address',
                  errorText: state.username.displayError != null
                      ? 'invalid username'
                      : null,
                );
              },
            ),
            const Spacing(10),
            BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (previous, current) =>
                  previous.password != current.password,
              builder: (context, state) {
                return CustomPasswordfield(
                  label: 'Password',
                  onChange: (password) => context.read<LoginBloc>().add(
                        LoginPasswordChanged(password),
                      ),
                  errorText: state.password.displayError != null
                      ? 'Password is required'
                      : null,
                );
              },
            ),
            Spacing.small(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRememberPassword(),
                InkWell(
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: AppColors.text1,
                        fontSize: 12.sp,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () => {}
                    // Navigator.pushNamed(context, Routes.forgotPassword),
                    )
              ],
            ),
            const Spacing(25),
            BlocBuilder<LoginBloc, LoginState>(
              // buildWhen: (previous, current) => current.isValid,,
              builder: (context, state) {
                return CustomButton(
                  loading: state.status.isInProgress,
                  label: 'Login',
                  onPressed: state.isValid
                      ? () {
                          context.read<LoginBloc>().add(const LoginSubmitted());
                        }
                      : null,
                );
              },
            ),
          ],
        ),
      );
    // );
  }

  Widget _buildRememberPassword() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.isRememberPassword.value != current.isRememberPassword.value,
      builder: (context, state) {
        return Flexible(
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () => context
                .read<LoginBloc>()
                .add(const LoginRememberPasswordChanged()),
            child: Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(
                      color: AppColors.text2,
                    ),
                  ),
                  child: state.isRememberPassword.value
                      ? const Center(
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color: Colors.green,
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                SizedBox(width: 4.w),
                Flexible(
                  child: Text(
                    'Remember this password',
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.5,
                      color: AppColors.text2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
