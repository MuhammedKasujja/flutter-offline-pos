
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:offline_kalteck_pos/core/infra.dart';
import 'package:offline_kalteck_pos/widgets/widgets.dart';

import 'cubit/forgot_password_cubit.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
      ),
      body: BlocProvider(
        create: (context) => ForgotPasswordCubit(),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 28.sp,
                  color: AppColors.text1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox().scaleHeight(12),
              Text(
                'Don’t worry! It happens. Please enter the email address that is  associated with your account.',
                style: TextStyle(
                  color: AppColors.text2,
                  fontSize: 12.sp,
                  height: 1.5,
                ),
              ),
              const SizedBox().large(),
              BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                buildWhen: (previous, current) =>
                    previous.email != current.email,
                builder: (context, state) {
                  return CustomTextfield(
                    onChange: (value) =>
                        context.read<ForgotPasswordCubit>().emailChanged(value),
                    label: 'Email address',
                    hint: 'Please enter your email address',
                    inputType: TextInputType.emailAddress,
                    errorText: state.email.displayError != null
                        ? 'invalid email address'
                        : null,
                  );
                },
              ),
              const Spacer(),
              const SizedBox().large(),
              _buildButton(),
              const SizedBox().small(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          showDialog(
            context: context,
            builder: (ctx) => AppAlertDialog(
              btnText: 'Continue',
              icon: SvgPicture.string(Assets.otpCodeEmailSentIcon),
              title: 'OTP code sent to your email',
              body: "We have just sent you an email with the OTP code.",
              onAction: () => {},
            ),
          );
        } else if (state.status.isFailure) {
          Utility.showAlert(state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          loading: state.status.isInProgress,
          label: 'Send',
          onPressed: state.isValid
              ? () {
                  context.read<ForgotPasswordCubit>().submittedForgotPassword();
                }
              : null,
        );
      },
    );
  }
}
