import 'package:flutter/material.dart';
import 'package:offline_kalteck_pos/core/infra.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? route;
  final bool isLogout;
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    this.route,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        if (route != null) {
          if (isLogout) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              route!,
              (route) => false,
            );
            return;
          }
          Navigator.pushNamed(context, route!);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 32.r),
        child: Row(
          children: [
            Icon(
              icon,
              color: isLogout ? Colors.red : AppColors.textHint,
            ),
            SizedBox(
              width: 16.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                color: isLogout ? Colors.red : AppColors.text1,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
