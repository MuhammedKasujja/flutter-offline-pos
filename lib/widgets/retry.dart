import 'package:flutter/material.dart';
import 'package:offline_kalteck_pos/core/infra.dart';

class RetryWidget extends StatelessWidget {
  final Function()? onRetry;
  final String error;
  const RetryWidget({
    Key? key,
    required this.onRetry,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8).r,
              ),
            ),
            child: Text(
              'Try Again',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(error),
        ],
      ),
    );
  }
}
