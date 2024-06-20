import 'dart:io';

import 'package:flutter/material.dart';

import '../configs/theme_config.dart';
import '../utils/ui_utils/text_styles/custom_text_style.dart';
import 'header_curve.dart';

// ignore: must_be_immutable
class RightHeaderCurveWidget extends StatelessWidget {
  late double _widgetHeight;
  late double _curveHeight;
  RightHeaderCurveWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _widgetHeight = Platform.isIOS ? 3.5 : 3.8;
    _curveHeight = Platform.isIOS ? 4.2 : 3.8;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / _widgetHeight,
      child: Stack(
        // overflow: Overflow.visible,
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height / _curveHeight),
            painter: HeaderCurve(),
          ),
          Center(
              child: Text(
            "POS",
            style: getTextStyle(color: WHITE_COLOR, fontSize: 40.0),
          ))
        ],
      ),
    );
  }
}

