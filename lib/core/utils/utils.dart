
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:offline_kalteck_pos/core/infra.dart';

import '../../widgets/alert_dialog.dart';


class Utility {
  Utility._();

  static void showAlert(String? message) {
    if (message == null) return;
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      // timeInSecForIosWeb: 1,
      // backgroundColor: Colors.red,
      // textColor: Colors.white,
      // fontSize: 14.sp,
    );
  }

  static showAppDialog(BuildContext context, {String? route}) {
    showDialog(
      context: context,
      builder: (ctx) => AppAlertDialog(
        btnText: 'Continue',
        icon: SvgPicture.string(Assets.otpCodeEmailSentIcon),
        title: 'OTP code sent to your email',
        body: 'We have just sent you an email with the OTP code.',
        onAction: () {
          if (route != null) {
            if (route.isEmpty) {
              Navigator.pop(context);
            } else {
              Navigator.pushNamed(context, route);
            }
          }
        },
      ),
    );
  }

  static showAppBottomSheet({
    required BuildContext context,
    required Widget child,
    bool isScrollable = true,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollable,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.r),
        ),
      ),
      builder: (context) {
        return child;
      },
    );
  }
}
