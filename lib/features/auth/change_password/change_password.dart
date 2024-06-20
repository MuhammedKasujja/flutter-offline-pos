
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:offline_kalteck_pos/core/infra.dart';
import 'package:offline_kalteck_pos/widgets/widgets.dart';

import '../sign_up/widgets/password_checker.dart';
import 'bloc/change_password_cubit.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Change your password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => ChangePasswordCubit(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                  buildWhen: (previous, current) =>
                      previous.oldPassword != current.oldPassword,
                  builder: (context, state) {
                    return CustomPasswordfield(
                      isNewPassword: false,
                      onChange: (value) => context
                          .read<ChangePasswordCubit>()
                          .oldPasswordChanged(value),
                      label: 'Current Password',
                      hint: 'Current password',
                      errorText: state.oldPassword.displayError != null
                          ? 'invalid password'
                          : null,
                    );
                  },
                ),
                const SizedBox().medium(),
                BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                  buildWhen: (previous, current) =>
                      previous.password != current.password,
                  builder: (context, state) {
                    return CustomPasswordfield(
                      onChange: (value) => context
                          .read<ChangePasswordCubit>()
                          .newPasswordChanged(value),
                      label: 'New Password',
                      hint: 'Enter new password',
                    );
                  },
                ),
                BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                  builder: (context, state) {
                    return NewPasswordChecker(
                      validator: state.password.displayError,
                    );
                  },
                ),
                const SizedBox().medium(),
                BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                  buildWhen: (previous, current) =>
                      previous.password != current.password ||
                      previous.confirmedPassword != current.confirmedPassword,
                  builder: (context, state) {
                    return CustomPasswordfield(
                      hint: 'Re-enter password',
                      label: 'Confirm Password',
                      onChange: (value) => context
                          .read<ChangePasswordCubit>()
                          .confirmedPasswordChanged(value),
                      errorText: state.confirmedPassword.displayError != null
                          ? 'Password doesn’t match'
                          : null,
                    );
                  },
                ),
                BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                  builder: (context, state) {
                    return state.isValid
                        ? Column(
                            children: [
                              const SizedBox().scaleHeight(12),
                              const Text(
                                'Password match',
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          )
                        : const SizedBox.shrink();
                  },
                ),
                const SizedBox().large(),
                BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                  listener: (context, state) {
                    if (state.status.isSuccess) {
                      showDialog(
                        context: context,
                        builder: (ctx) => AppAlertDialog(
                          btnText: 'Proceed to Login',
                          icon: SvgPicture.string(Assets.accountVerifiedIcon),
                          title: 'Password Updated Successfully',
                          onAction: () =>{}
                              // Navigator.pushNamed(context, Routes.login),
                        ),
                      );
                    } else if (state.status.isFailure) {
                      Utility.showAlert(state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      loading: state.status.isInProgress,
                      label: 'Update',
                      onPressed: state.isValid
                          ? () {
                              context
                                  .read<ChangePasswordCubit>()
                                  .changePasswordFormSubmitted();
                            }
                          : null,
                    );
                  },
                ),
                const SizedBox().small(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
