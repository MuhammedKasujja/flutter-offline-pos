import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

class AppTheme {
  AppTheme._();

  static light(BuildContext context) => ThemeData(
        primarySwatch: _createMaterialColor(const Color(0xFFF1C111)),
        colorScheme: ColorScheme(
          primary: const Color(0xFFF1C111),
          onPrimary: AppColors.text1,
          secondary: const Color(0xFF0A2139),
          onSecondary: Colors.white,
          surface: Colors.white,
          onSurface: const Color(0xFF0A2139),
          onBackground: const Color(0xFF0A2139),
          background: Colors.white,
          brightness: Brightness.light,
          error: Colors.red,
          onError: Colors.white,
        ),
        scaffoldBackgroundColor: AppColors.backgroundLight,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
          backgroundColor: AppColors.backgroundLight,
          centerTitle: true,
          elevation: 0,
        ),
        fontFamily: 'Inter',
        textTheme: TextTheme(
          titleSmall: GoogleFonts.inter(
            color: const Color(0xFF0A2139),
            fontSize: ScreenUtil().setSp(20),
          ),
          titleMedium: GoogleFonts.inter(
            color: const Color(0xFF0A2139),
            fontSize: ScreenUtil().setSp(24),
          ),
          displaySmall: GoogleFonts.inter(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(18),
              fontWeight: FontWeight.w700),
          displayLarge: GoogleFonts.inter(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(36),
            fontWeight: FontWeight.w200,
          ),
          labelMedium: GoogleFonts.inter(
            color: const Color(0xFF0A2139),
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
          labelSmall: GoogleFonts.inter(
            color: const Color(0xFF0A2139),
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
          labelLarge: GoogleFonts.inter(
              fontSize: 18.sp,
              fontWeight: FontWeight.normal,
              color: const Color(0xFFF1C111)),
          headlineSmall: GoogleFonts.inter(
            color: const Color(0xFF0A2139),
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: GoogleFonts.inter(
            color: const Color(0xFF0A2139),
            fontSize: 36.sp,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: GoogleFonts.inter(
            color: Theme.of(context).hintColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        dividerTheme: DividerThemeData(
          thickness: .5,
          color: AppColors.divider,
        ),
      );

  static MaterialColor _createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
